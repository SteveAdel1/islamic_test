import 'package:dartz/dartz.dart';
import 'package:islami/core/config/failure/failure.dart';
import 'package:islami/data/models/radio_model_response.dart';
import 'package:islami/domin/repo/radio_repo.dart';

class RadioUseCase{
  final RadioRepo radioRepo;

  RadioUseCase(this.radioRepo);

  Future<Either<Failure , List<RadioModelResponse>>> execute()async{
    return await radioRepo.getRadioData();
  }
}