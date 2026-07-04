import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cinemagic/models/hive/models/show_preview.dart';
import 'package:cinemagic/features/watchlist_reminder/domain/repositories/watchlist_reminder_repository.dart';

class WatchlistReminderRepositoryImpl implements WatchlistReminderRepository {
  final Box<HiveShowPreview> _watchlistBox = Hive.box<HiveShowPreview>('watchlist');

  @override
  Future<void> scheduleReminder(String showId, DateTime date, TimeOfDay time) async {
    for (int i = 0; i < _watchlistBox.length; i++) {
      final item = _watchlistBox.getAt(i);
      if (item?.id == showId) {
        item!.watchDate = date;
        item.watchTime = time;
        await _watchlistBox.putAt(i, item);
        break;
      }
    }
  }

  @override
  Future<void> cancelReminder(String showId) async {
    for (int i = 0; i < _watchlistBox.length; i++) {
      final item = _watchlistBox.getAt(i);
      if (item?.id == showId) {
        item!.watchDate = null;
        item.watchTime = null;
        await _watchlistBox.putAt(i, item);
        break;
      }
    }
  }

  @override
  Future<Map<String, DateTime>> getActiveReminders() async {
    final Map<String, DateTime> reminders = {};
    for (var item in _watchlistBox.values) {
      if (item.watchDate != null && item.watchTime != null) {
        final dateTime = DateTime(
          item.watchDate!.year,
          item.watchDate!.month,
          item.watchDate!.day,
          item.watchTime!.hour,
          item.watchTime!.minute,
        );
        reminders[item.id] = dateTime;
      }
    }
    return reminders;
  }
}
