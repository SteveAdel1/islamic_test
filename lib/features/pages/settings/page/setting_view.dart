
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/provider/app_provider.dart';


class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  List<String> langs = ["English", "عربي"];
  List<String> themes = ["Light", "Dark"];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // var local = AppLocalizations.of(context)!;
     var vm = Provider.of<SettingProvider>(context);
    return Padding(
      padding: EdgeInsets.all(35),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          "local.language",
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomDropdown(
          items: langs,
          decoration: CustomDropdownDecoration(
            closedFillColor:
            vm.isDark() ? Color(0xFF141A2E) : Color(0xFFB7935F),
            expandedFillColor:
            vm.isDark() ? Color(0xFF141A2E) : Color(0xFFB7935F),
          ),
          // initialItem: vm.currentLanguage != "en" ? "عربى" : "English" ,
          onChanged: (value) {
            if (value == "English") {
              vm.changeLanguage("en");
            } else if (value == "عربي") {
              vm.changeLanguage("ar");
            }
          },
        ),
        const SizedBox(
          height: 50,
        ),
        Text("local.theme", style: theme.textTheme.bodyMedium),
        const SizedBox(
          height: 10,
        ),
        CustomDropdown(
          items: themes,
          initialItem: vm.isDark() ? "Dark" : "Light",
          decoration: CustomDropdownDecoration(
            closedFillColor:
            vm.isDark() ? Color(0xFF141A2E) : Color(0xFFB7935F),
            expandedFillColor:
            vm.isDark() ? Color(0xFF141A2E) : Color(0xFFB7935F),
          ),
          onChanged: (value) {
            if (value == "Light") {
              vm.changeThemeMode(ThemeMode.light);
            } else if (value == "Dark") {
              vm.changeThemeMode(ThemeMode.dark);
            }
          },
        )
      ]),
    );
  }
}
