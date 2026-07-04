import 'package:flutter/material.dart';

abstract class WatchlistReminderRepository {
  Future<void> scheduleReminder(String showId, DateTime date, TimeOfDay time);
  Future<void> cancelReminder(String showId);
  Future<Map<String, DateTime>> getActiveReminders();
}
