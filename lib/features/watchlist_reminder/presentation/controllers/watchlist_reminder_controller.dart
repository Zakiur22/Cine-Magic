import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cinemagic/models/hive/models/show_preview.dart';
import 'package:cinemagic/features/watchlist_reminder/data/repositories/watchlist_reminder_repository_impl.dart';
import 'package:cinemagic/features/watchlist_reminder/domain/repositories/watchlist_reminder_repository.dart';
import 'package:cinemagic/constants/colors.dart';

class WatchlistReminderController extends GetxController {
  final WatchlistReminderRepository _repository = WatchlistReminderRepositoryImpl();
  
  // Store of active reminders: Key is showId, Value is DateTime scheduled
  final RxMap<String, DateTime> activeReminders = <String, DateTime>{}.obs;
  
  Timer? _reminderCheckTimer;

  @override
  void onInit() {
    super.onInit();
    loadReminders();
    // Start periodic timer to check reminders every 30 seconds
    _reminderCheckTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      _checkReminders();
    });
    
    // Listen to changes in the watchlist box to auto-reload
    Hive.box<HiveShowPreview>('watchlist').listenable().addListener(_onWatchlistChanged);
  }

  @override
  void onClose() {
    _reminderCheckTimer?.cancel();
    Hive.box<HiveShowPreview>('watchlist').listenable().removeListener(_onWatchlistChanged);
    super.onClose();
  }

  void _onWatchlistChanged() {
    loadReminders();
  }

  Future<void> loadReminders() async {
    final reminders = await _repository.getActiveReminders();
    activeReminders.assignAll(reminders);
  }

  Future<void> scheduleReminder(String showId, String title, DateTime date, TimeOfDay time) async {
    await _repository.scheduleReminder(showId, date, time);
    await loadReminders();
    
    final scheduledDateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    
    Get.snackbar(
      "Reminder Scheduled",
      "We'll remind you to watch '$title' at ${scheduledDateTime.toString().substring(0, 16)}",
      backgroundColor: kAccentColor.withValues(alpha: 0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.all(15),
      borderRadius: 10,
    );
  }

  Future<void> cancelReminder(String showId, String title) async {
    await _repository.cancelReminder(showId);
    await loadReminders();
    
    Get.snackbar(
      "Reminder Cancelled",
      "Reminder for '$title' has been removed",
      backgroundColor: Colors.redAccent.withValues(alpha: 0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(15),
      borderRadius: 10,
    );
  }

  void _checkReminders() {
    final now = DateTime.now();
    final Box<HiveShowPreview> watchlistBox = Hive.box<HiveShowPreview>('watchlist');
    
    activeReminders.forEach((showId, reminderTime) async {
      // If reminderTime is equal to or past current time
      if (now.isAfter(reminderTime)) {
        // Find movie title
        String movieTitle = "Movie";
        for (var item in watchlistBox.values) {
          if (item.id == showId) {
            movieTitle = item.title;
            break;
          }
        }
        
        // Trigger notification popup
        _triggerNotification(showId, movieTitle);
        
        // Cancel reminder in storage so it doesn't trigger again
        await _repository.cancelReminder(showId);
      }
    });
  }

  void _triggerNotification(String showId, String title) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: kBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.play_circle_filled_rounded,
                color: kAccentColor,
                size: 60,
              ),
              const SizedBox(height: 15),
              const Text(
                "Watchlist Reminder",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "It's time to watch '$title'!",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text(
                      "Snooze",
                      style: TextStyle(color: kGreyColor),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kAccentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Watch Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}
