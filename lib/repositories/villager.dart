import 'package:ACApp/repositories/base.dart';
import 'package:ACApp/services/api_service.dart';
import 'package:dio/dio.dart';
import '../models/index.dart';
import 'index.dart';

class VillagerRepository extends BaseRepository {
  List<Villager> villagerList = [];
  List<String> villagerListName = [];
  Villager villager;
  Villagers villagers;

  @override
  Future<void> loadData() async {
    // Try to load the data using [ApiService]
    try {
      final Response villagersReponse = await ApiService.getVillager();

      villagerList = [
        for (final villager in villagersReponse.data) Villager.fromJson(villager)
      ];

      finishLoading();
    } on DioError catch (e) {
      print(e);
      receivedError();
    }
  }

  Villager getVillager(int index) => villagerList[index];

}
