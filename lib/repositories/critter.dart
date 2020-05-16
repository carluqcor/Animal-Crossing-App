import 'package:ACApp/repositories/base.dart';
import 'package:ACApp/services/api_service.dart';
import 'package:dio/dio.dart';
import '../models/index.dart';

class CritterRepository extends BaseRepository {
  List<Critter> critterList = [];

  @override
  Future<void> loadData() async {
    // Try to load the data using [ApiService]
    try {
      final Response critterResponse = await ApiService.getCritters();
      critterList = [
        for (final critter in critterResponse.data)
          Critter.fromJson(critter)
      ];

      finishLoading();
    } on DioError catch (e) {
      print(e);
      receivedError();
    }
  }

  Critter getCritter(int index) => critterList[index];

}
