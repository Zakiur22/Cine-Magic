class WatchlistReminder {
  final String showId;
  final String title;
  final DateTime reminderTime;
  final bool isTriggered;

  WatchlistReminder({
    required this.showId,
    required this.title,
    required this.reminderTime,
    this.isTriggered = false,
  });
}
