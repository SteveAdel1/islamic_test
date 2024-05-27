import 'package:flutter/material.dart';
import 'package:islami/core/provider/app_provider.dart';
import 'package:islami/main.dart';
import 'package:provider/provider.dart';


class Constants{
  static var mediaQuery = MediaQuery.of(navigatorKey.currentState!.context).size;
  static var theme = Theme.of(navigatorKey.currentState!.context);
  static var vm= Provider.of<SettingProvider>(navigatorKey.currentState!.context);
  static String  baseUrl= "https://mp3quran.net/api/v3";

}