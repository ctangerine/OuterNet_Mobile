import 'drift_database.dart';

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._internal();

  factory DatabaseProvider() => _instance;

  late AppDatabase database;

  DatabaseProvider._internal() {
    database = AppDatabase();
  }

  // DatabaseProvider._internal() {
  //   database = _constructDb();
  // }

  // AppDatabase _constructDb() {
  //   if (kIsWeb) {
  //     return AppDatabase(WebDatabase('db'));
  //   } else {
  //     return AppDatabase(NativeDatabase.memory());
  //   }
  // }
}

final dbProvider = DatabaseProvider();