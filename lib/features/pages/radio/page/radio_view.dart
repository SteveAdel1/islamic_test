import 'package:islami/main.dart';
import 'package:flutter/material.dart';
import '../widgets/radio_page_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/features/pages/radio/cubit/radio_cubit.dart';
import 'package:islami/features/pages/radio/cubit/radio_states.dart';

class RadioView extends StatefulWidget {
  RadioView({super.key});
  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  var vm = RadioCubit();

  @override
  void initState() {
    vm.getData();
    super.initState();
  }

  @override
  //var vm = BlocProvider.of<RadioCubit>(navigatorKey.currentState!.context);
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => vm,
          child: BlocBuilder<RadioCubit, RadioStates>(
            bloc: vm,
            builder: (context, state) {
              switch (state) {
                case LoadingRadioState():
                  {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                case ErrorRadioState():
                  {
                    return Text(state.error);
                  }
                case SuccessRadioState():
                  {
                    print("respone list ${state.radioList.radios![0].name}");
                    //Navigator.pop(context);
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 80, left: 10, right: 10, bottom: 10),
                      child: ListView(children: [
                        Image.asset("assets/images/radio.png"),
                        SizedBox(
                          height: 80,
                        ),
                        
                        Text(
                            textAlign: TextAlign.center,
                            state.radioList.radios?[0].name ??
                            " asfsdfsdfs"),
                        SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/Icon metro-next.png"),
                            Image.asset("assets/images/Icon awesome-play.png"),
                            Image.asset(
                                "assets/images/Icon metro-next (1).png"),
                          ],
                        )
                      ]),
                    );
                  }
              }
            },
          ),
        ),
      ),
    );

    //   SafeArea(
    //   child: BlocProvider(
    //     create: (context) => vm,
    //     child: BlocBuilder<RadioCubit,RadioStates>(
    //       bloc: vm,
    //       builder: (context, state) {
    //         return Scaffold(
    //             body: RadioPageWidget()
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
// switch(state){
// case LoadingRadioState () : {
// return Center(child: CircularProgressIndicator(),);
// }
// case ErrorRadioState () : {
// return Text(state.error);
// }
// case SuccessRadioState () :{
// return RadioPageWidget();
// }
//
// }
