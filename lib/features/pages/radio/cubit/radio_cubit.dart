import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/services/web_services.dart';
import 'package:islami/data/data_source/radio_data_source.dart';
import 'package:islami/data/data_source/radio_data_source_imp.dart';
import 'package:islami/data/models/radio_model_response.dart';
import 'package:islami/data/repo_imp/radio_repo_imp.dart';
import 'package:islami/domin/repo/radio_repo.dart';
import 'package:islami/domin/use_case/radio_use_case.dart';
import 'package:islami/features/pages/radio/cubit/radio_states.dart';

import '../../../../core/config/failure/server_failure.dart';

class RadioCubit extends Cubit<RadioStates>{

   List<RadioModelResponse>? radios  ;
  int currentIndex = 0;

  RadioCubit():super(LoadingRadioState());

  final WebServices _services = WebServices();
  late RadioDataSource radioDataSource ;
  late RadioRepo radioRepo;
  late RadioUseCase radioUseCase;

  Future<bool> getData() async{

    radioDataSource = RadioDataSourceImp(_services.freeDio);
    radioRepo = RadioRepoImp(radioDataSource);
    radioUseCase = RadioUseCase(radioRepo);
     var result  = await radioUseCase.execute();

     return result.fold((fail) {
       var error = fail as ServerFailure ;
       emit(ErrorRadioState(error: 'something went wrong , try again'));
       return Future.value(false);
     }, (data) {
       emit(SuccessRadioState(data));
       return Future.value(true);
     });
  }

}