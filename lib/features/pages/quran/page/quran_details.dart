
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/features/pages/quran/page/quran_view.dart';

import 'package:provider/provider.dart';

import '../../../../core/provider/app_provider.dart';

class Quran_Detalis_View extends StatefulWidget {
  static const String routeName = "quranDetails";

  Quran_Detalis_View({super.key});

  @override
  State<Quran_Detalis_View> createState() => _Quran_Detalis_ViewState();
}

class _Quran_Detalis_ViewState extends State<Quran_Detalis_View> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetail;
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);
    if (versesList.isEmpty) loadData(args.suraNumber);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(vm.getBackground()), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text("إسلامى"),
        ),
        body: Container(
          width: mediaQuery.width,
          height: mediaQuery.height,
          margin: EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 80),
          padding: EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
          decoration: BoxDecoration(
              color: vm.isDark()
                  ? Color(0xFF141A2E).withOpacity(0.8)
                  : Color(0XFFF8F8F8).withOpacity(0.8),
              borderRadius: BorderRadius.circular(25)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "سورة${args.suraName}",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: "El Messiri",
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.play_circle_fill_rounded,
                  size: 28,
                  color: vm.isDark() ? Color(0xFFFACC1D) : Colors.black87,
                )
              ],
            ),
            Divider(
              thickness: 1,
              color: theme.primaryColor,
            ),
            if (versesList.isEmpty)
              Center(
                child: CircularProgressIndicator(
                  color: theme.primaryColor,
                ),
              ),
            if (versesList.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    "{${index + 1}}${versesList[index]}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "El Messiri",
                        fontSize: 25,
                        color: vm.isDark() ? Color(0xFFFACC1D) : Colors.black87,
                        fontWeight: FontWeight.normal),
                  ),
                  itemCount: versesList.length,
                ),
              )
          ]),
        ),
      ),
    );
  }

  Future<void> loadData(String suraNumber) async {
    String suracontent =
    await rootBundle.loadString("assets/files/$suraNumber.txt");
    versesList = suracontent.split("\n");
    setState(() {});
  }
}
