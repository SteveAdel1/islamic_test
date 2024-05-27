
import 'package:flutter/material.dart';
import 'package:islami/features/pages/quran/page/quran_details.dart';

import 'package:provider/provider.dart';

import '../widgets/sura_tail.dart';

class QuranView extends StatelessWidget {
  final List<String> suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery
        .of(context)
        .size;
    //var vm = Provider.of<SettingProvider>(context);
    return Scaffold(
        body: Column(
          children: [
            Image(
              image: AssetImage("assets/images/quran_header.png"),
              height: mediaQuery.height * 0.2,
            ),
            Divider(thickness: 1, color: theme.primaryColor),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "رقم السورة",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "El Messiri",
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: theme.primaryColor,
                ),
                Expanded(
                  child: Text(
                    "اسم السورة",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "El Messiri",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            Divider(thickness: 1, color: Colors.tealAccent),
            Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Quran_Detalis_View.routeName,
                              arguments: SuraDetail(
                                  suraName[index], (index + 1).toString()));
                        },
                        child: SuraTile(
                            suraName: suraName[index],
                            suraNumber: (index + 1).toString()),
                      ),
                  itemCount: suraName.length,
                ))
          ],
        ));
  }
}

class SuraDetail {
  String suraName;
  String suraNumber;

  SuraDetail(this.suraName, this.suraNumber);

}
