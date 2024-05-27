import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/data/models/radio_model_response.dart';
import 'package:islami/features/pages/radio/cubit/radio_cubit.dart';
import 'package:islami/features/pages/radio/cubit/radio_states.dart';

class RadioPageWidget extends StatefulWidget {

   RadioPageWidget({super.key });
   @override
  @override
  State<RadioPageWidget> createState() => _RadioPageWidgetState();
}

class _RadioPageWidgetState extends State<RadioPageWidget> {
  @override
  Widget build(BuildContext context) {
    var vm = RadioCubit();

    // var vm = BlocProvider.of<RadioCubit>(context);
    return BlocProvider(
      create: (context) => vm,
      child: BlocBuilder<RadioCubit,RadioStates>(
        bloc: vm,
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(top: 80,
                left: 10,
                right: 10,
                bottom: 10),
            child: ListView(children: [
              Image.asset("assets/images/radio.png"),
              SizedBox(
                height: 80,
              ),  
              Text(textAlign: TextAlign.center,
                  // state.radios![vm.currentIndex].name ?? " asfsdfsdfs"
                  " asfsdfsdfs"
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/Icon metro-next.png"),
                  Image.asset("assets/images/Icon awesome-play.png"),
                  Image.asset("assets/images/Icon metro-next (1).png"),
                ],
              )
            ]),
          );
        
        },

      ),
    );
  }
}
