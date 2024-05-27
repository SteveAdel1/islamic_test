import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/../../features/pages/hadeth/page/hadeth_view.dart';
import '/../../features/pages/home/page/home_view.dart';
import '/../../features/pages/radio/page/radio_view.dart';
import '/../../features/pages/settings/page/setting_view.dart';
import '/../../../features/pages/splash/page/splash_view.dart';
import '/../../features/pages/tasbeh/page/tasbeh_view.dart';
import '../pages_route_names/pages_route_names.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteNames.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );

      case PagesRouteNames.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );

      case PagesRouteNames.hadethView:
        return MaterialPageRoute(
          builder: (context) => const HadethView(),
          settings: settings,
        );

      case PagesRouteNames.radioView:
        return MaterialPageRoute(
          builder: (context) =>  RadioView(),
          settings: settings,
        );

      case PagesRouteNames.tasbehView:
        return MaterialPageRoute(
          builder: (context) => const TasbehView(),
          settings: settings,
        );

      case PagesRouteNames.settingsView:
        return MaterialPageRoute(
          builder: (context) =>  SettingsView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
