
import 'package:flutter/material.dart';

class SuraTile extends StatelessWidget {
  String suraName;
  String suraNumber;

  SuraTile({required this.suraName, required this.suraNumber, super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Text(
            suraNumber,
            textAlign: TextAlign.center,
            style: const TextStyle(
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
            suraName,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 25,
                fontFamily: "El Messiri",
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
