import 'package:flutter/material.dart';
import 'package:islami/core//config/application_theme_manager.dart';
import 'package:islami/core//config/routes/pages_route_names/pages_route_names.dart';
import 'package:islami/core//config/routes/routes/routes.dart';
import 'package:provider/provider.dart';

import 'core/provider/app_provider.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GlobalKey globalKey = GlobalKey();

void main() {
  runApp(ChangeNotifierProvider(
      create:(context) => SettingProvider(),
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami app',
      theme: ApplicationThemeManager.lightTheme,
      darkTheme: ApplicationThemeManager.darkTheme,
      //initialRoute: PagesRouteNames.initial,
      onGenerateRoute: Routes.onGenerateRoute,
      navigatorKey: navigatorKey,
    );
  }
}


