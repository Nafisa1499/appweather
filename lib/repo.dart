import 'package:dio/dio.dart';
import 'package:flutter_application_1/model.dart';

class RepositaryAPI {
  final Dio dio = Dio();

  Future<ModelClass> ListApi() async {
    try {
      Response response = await dio.get(
          "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m&daily=weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset&timezone=auto&past_days=3");

      return ModelClass.fromJson(response.data);
    } catch (error) {
      return ModelClass.withError("no data");
    }
  }
}

class ApiRepository {
  final Apiprovider = RepositaryAPI();

  Future<ModelClass> ListApi() {
    return Apiprovider.ListApi();
  }
}

class InternetError extends Error {}
