import 'package:ACApp/repositories/base.dart';
import 'package:ACApp/services/api_service.dart';
import 'package:dio/dio.dart';
import '../models/index.dart';
import 'index.dart';

class CritterRepository extends BaseRepository {
  List<Critter> critterList = [];
  List<String> critterListName = [];
  Critter critter;
  Critters critters;

  @override
  Future<void> loadData() async {
    // Try to load the data using [ApiService]
    try {
      // Receives the data and parse it
      final Response crittersReponse = await ApiService.getCritters();

      critters = Critters.fromJson(crittersReponse.data);

      for (int x = 0; x < critters.critters.length; x++) {
        critterListName.add(critters.critters[x]['title']);
      }

      for (int x = 0; x < critterListName.length; x++) {
        final Response critter =
          await ApiService.getCritter(critterListName[x]);
        critterList.add(Critter.fromJson(critter.data));
      }

      finishLoading();
    } on DioError catch (e) {
      print(e);
      receivedError();
    }
  }

  Critter getCritter(int index) => critterList[index];

}
