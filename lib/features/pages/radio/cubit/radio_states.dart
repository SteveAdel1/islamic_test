import '../../../../data/models/radio_model_response.dart';

sealed class RadioStates{


}

class LoadingRadioState extends RadioStates{}

class SuccessRadioState extends RadioStates{

  RadioModelResponse radioList;
  SuccessRadioState({required this.radioList});
}

class ErrorRadioState extends RadioStates{

  String error ;
  ErrorRadioState({required this.error});
}