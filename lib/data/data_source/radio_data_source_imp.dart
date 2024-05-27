import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:islami/core/config/constants.dart';
import 'package:islami/core/config/routes/end_points/end_points.dart';
import 'package:islami/data/data_source/radio_data_source.dart';

class RadioDataSourceImp extends RadioDataSource{
  final Dio dio;

  RadioDataSourceImp(this.dio,);

  @override
  Future<Response> getRadioData() async{
    return await dio.get(Constants.baseUrl+EndPoints.quranEndPoint);


  }

}