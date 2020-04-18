import 'package:ACApp/repositories/base.dart';
import 'package:ACApp/services/api_service.dart';
import 'package:dio/dio.dart';
import '../models/index.dart';
import 'index.dart';

class VillagerRepository extends BaseRepository {
  List<Villager> villagerList;
  List<String> villagerListName;
  Villager villager;

  @override
  Future<void> loadData() async {
    // Try to load the data using [ApiService]
    try {
      // Receives the data and parse it
      final Response<List> villagersListRequest = await ApiService.getVillagers();
      
      villagerListName = [
        for (final villagerName in villagersListRequest.data) Villager.fromJson(villagerName).toString()
      ];

      for (int x = 0 ; x < villagerList.length ; x ++) {
        final Response villager = await ApiService.getVillager(villagerListName[x]);
        villagerList.add(Villager.fromJson(villager.data));
      } 
      
      finishLoading();
    } catch (_) {
      receivedError();
    }
  }
}