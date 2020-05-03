import 'package:ACApp/repositories/base.dart';
import 'package:ACApp/services/api_service.dart';
import 'package:dio/dio.dart';
import '../models/index.dart';

class TodayRepository extends BaseRepository {
  Today today;

  @override
  Future<void> loadData() async {
    // Try to load the data using [ApiService]
    try {
      // Receives the data and parse it
      final Response todayResponse = await ApiService.getTodayResponse();

      today = Today.fromJson(todayResponse.data);

      finishLoading();
    } on DioError catch (e) {
      print(e);
      receivedError();
    }
  }
}
