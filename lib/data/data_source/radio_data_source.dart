import 'package:dio/dio.dart';

abstract class RadioDataSource {
  Future<Response> getRadioData() ;
}