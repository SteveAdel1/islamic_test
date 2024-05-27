import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/features/pages/radio/cubit/radio_cubit.dart';
import 'package:islami/features/pages/radio/cubit/radio_states.dart';
import 'package:islami/main.dart';

import '../widgets/radio_page_widget.dart';

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
          create: (context) => vm..getData(),
          child: BlocBuilder<RadioCubit,RadioStates>(
            bloc: vm,
            builder: (context, state) {
              switch(state){
                case LoadingRadioState():{
                  return Center(child: CircularProgressIndicator(),);
                }
                case ErrorRadioState():{
                  return Text(state.error);
                }
                case SuccessRadioState():{
                  print("respone list ${vm.radios}");
                  //Navigator.pop(context);
                  return RadioPageWidget();
                }
              }
            },
          ),
        ),
      ),
    ) ;



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
