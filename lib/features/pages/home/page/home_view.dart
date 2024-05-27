import 'package:flutter/material.dart';
import 'package:islami/core/config/constants.dart';
import 'package:islami/core/provider/app_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage("assets/images/main_background.png"),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("إسلامى"),
        ),
          body: Constants.vm.screens[vm.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: vm.currentIndex,
            onTap:vm.changeIndex ,
            items: const [
              BottomNavigationBarItem(
                  icon:
                      const ImageIcon(AssetImage("assets/images/hadeth_icn.png")),
                  label: " Hadeth"),
              BottomNavigationBarItem(
                  icon:
                      const ImageIcon(AssetImage("assets/images/quran_icn.png")),
                  label: " Quran"),
              BottomNavigationBarItem(
                  icon:
                  const ImageIcon(AssetImage("assets/images/radio_icn.png")),
                  label: " Radio"),
              BottomNavigationBarItem(
                  icon:
                  const ImageIcon(AssetImage("assets/images/sebha_icn.png")),
                  label: " Sebha"),
              BottomNavigationBarItem(
                  icon:
                  const Icon(Icons.settings_rounded),
                  label: "Settings"),
            ],
          )),
    );
  }
}
