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
      // Receives the data and parse it
      final Response villagersReponse = await ApiService.getVillagers();

      villagers = Villagers.fromJson(villagersReponse.data);

      for (int x = 0; x < villagers.villagers.length; x++) {
        villagerListName.add(villagers.villagers[x]['title']);
      }

      for (int x = 0; x < villagerListName.length; x++) {
        final Response villager =
          await ApiService.getVillager(villagerListName[x]);
        villagerList.add(Villager.fromJson(villager.data));
      }

      finishLoading();
    } on DioError catch (e) {
      print(e);
      receivedError();
    }
  }

  Villager getVillager(int index) => villagerList[index];

}
