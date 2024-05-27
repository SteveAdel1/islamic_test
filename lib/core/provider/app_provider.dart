
import 'package:flutter/material.dart';

import '../../features/pages/hadeth/page/hadeth_view.dart';
import '../../features/pages/quran/page/quran_view.dart';
import '../../features/pages/radio/page/radio_view.dart';
import '../../features/pages/settings/page/setting_view.dart';
import '../../features/pages/tasbeh/page/tasbeh_view.dart';

class SettingProvider extends ChangeNotifier {

  List<Widget> screens= [
    HadethView(),
    QuranView(),
    RadioView(),
    TasbehView(),
    SettingsView()
  ];
  int currentIndex = 0;
  String currentLanguage = "en";
  ThemeMode currentThemeMode = ThemeMode.dark;

  changeLanguage(String newLanguage) {
    if (newLanguage == currentLanguage) {
      return;
    }

    currentLanguage = newLanguage;

    notifyListeners();
  }
  changeIndex(index){
     currentIndex=index ;
    notifyListeners();
  }

  changeThemeMode(ThemeMode newThemeMode) {
    // print(currentThemeMode);/
    print(newThemeMode);

    if (newThemeMode == currentThemeMode) return;

    currentThemeMode = newThemeMode;

    notifyListeners();
  }

  getBackground() {
    return currentThemeMode == "Dark"
        ? "assets/images/DarkMainBackground.png"
        : "assets/images/main_background.png";
  }

  bool isDark() {
    return currentThemeMode == "Dark";
  }
}
