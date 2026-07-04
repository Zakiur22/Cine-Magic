import 'package:hive/hive.dart';
import 'package:cinemagic/models/hive/models/actor_preview.dart';
import 'package:cinemagic/models/hive/models/show_preview.dart';
import 'package:cinemagic/models/hive/models/time_of_day.g.dart';
import 'package:cinemagic/models/hive/models/user.dart';

void registerAdapters() {
  Hive.registerAdapter(ShowPreviewAdapter());
  Hive.registerAdapter(ActorPreviewAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(TimeOfDayAdapter());
}
