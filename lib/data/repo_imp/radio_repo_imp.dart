import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:islami/domin/repo/radio_repo.dart';
import '../../core/config/failure/server_failure.dart';
import 'package:islami/core/config/failure/failure.dart';
import 'package:islami/data/models/radio_model_response.dart';
import 'package:islami/data/data_source/radio_data_source.dart';


class RadioRepoImp extends RadioRepo{

  final RadioDataSource radioDataSource;

  RadioRepoImp(this.radioDataSource);

  @override
  Future<Either<Failure,RadioModelResponse>> getRadioData() async{
      final response = await radioDataSource.getRadioData();
      late RadioModelResponse radioModel;
      try{
        if(response.statusCode == 200){
          radioModel=RadioModelResponse.fromJson(response.data);
          return right(radioModel);
        }
        else {
          return left(ServerFailure(
              statusCode: response.statusCode.toString(),
              message: response.data["message"]));
        }
      } on DioException catch(e){
        return left(ServerFailure(
            statusCode: e.response?.statusCode.toString() ?? "",
            message: e.response?.data["message"] ?? ""));
      }

  }

}