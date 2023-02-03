import 'package:isar/isar.dart';
part 'last_update.g.dart';

@collection
class LastUpdate {
  Id id = 0; // you can also use id = null to auto increment

  DateTime? visualSummaries;
  DateTime? podcasts;
}
