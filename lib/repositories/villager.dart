import 'package:ACApp/repositories/base.dart';
import 'package:ACApp/services/api_service.dart';
import 'package:ACApp/util/index.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/index.dart';

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
        for (final villager in villagersReponse.data)
          Villager.fromJson(villager)
      ];

      finishLoading();
    } on DioError catch (e) {
      print(e);
      receivedError();
    }
  }

  dynamic villagerGetter(String key) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getStringList(key)?.length;
    } catch (_) {
      return villagerList?.length;
    }
  }

  Villager getVillager(int index) => villagerList[index];
}
