part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const  appRoot = _Paths.appRoot;
  static const home = _Paths.home;
  static const  activity = _Paths.activity;
  static const  statistics = _Paths.statistics;
  static const  profile = _Paths.profile;
  static const  goal = _Paths.goal;

}

abstract class _Paths {
  static const splash = '/splash';
  static const  appRoot = '/app_root';
  static const home = '/home';
  static const  activity = '/activity';
  static const  statistics = '/statistics';
  static const  profile = '/profile';
  static const  goal = '/goal';

}
