import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/core//config/routes/pages_route_names/pages_route_names.dart';
import 'package:islami/main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
      () =>navigatorKey.currentState!.pushReplacementNamed(PagesRouteNames.homeView),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage("assets/images/splash_background.png"),
            fit: BoxFit.cover,
          )),
    );
  }
}
