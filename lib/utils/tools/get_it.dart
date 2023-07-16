import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => AuthorizationRepository());
  getIt.registerLazySingleton(() => TeacherRepository());
  getIt.registerLazySingleton(() => GroupRepository());
  getIt.registerLazySingleton(() => LessonsRepository());
  getIt.registerLazySingleton(() => ScoringRepository());
}
