import 'package:dartz/dartz.dart';
import '../../data/models/radio_model_response.dart';
import 'package:islami/core/config/failure/failure.dart';

abstract class RadioRepo{
  Future<Either<Failure, RadioModelResponse>> getRadioData();
}