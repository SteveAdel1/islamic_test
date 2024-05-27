import 'package:dartz/dartz.dart';
import 'package:islami/domin/repo/radio_repo.dart';
import 'package:islami/core/config/failure/failure.dart';
import 'package:islami/data/models/radio_model_response.dart';

class RadioUseCase{
  final RadioRepo radioRepo;

  RadioUseCase(this.radioRepo);

  Future<Either<Failure , RadioModelResponse>> execute()async{
    return await radioRepo.getRadioData();
  }
}