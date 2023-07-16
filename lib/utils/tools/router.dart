import 'package:najottalim_teachersapp/ui/lessons/presentation/lessons_page.dart';
import 'package:najottalim_teachersapp/ui/scoring/presentation/scoring_page.dart';
import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

abstract class RouteName {
  static const splash = 'splash';
  static const authorization = 'authorization';
  static const home = 'home';
  static const login = 'login';
  static const group = 'group';
  static const lessons = 'lessons';
  static const scoring = 'scoring';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RouteName.scoring:
        return MaterialPageRoute(
            builder: (_) => ScoringPage(lesson: args as String));
      case RouteName.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RouteName.group:
        return MaterialPageRoute(
            builder: (_) => GroupPage(group: args as GroupModel));
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RouteName.lessons:
        return MaterialPageRoute(
            builder: (_) => LessonsPage(group: args as GroupModel));
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
