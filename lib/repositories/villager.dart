import 'package:ACApp/repositories/base.dart';
import 'package:ACApp/services/api_service.dart';
import 'package:ACApp/util/index.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/index.dart';

class VillagerRepository extends BaseRepository {
  List<Villager> villagerList = [];
  List<Villager> villagerByUser = [];
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

      final auxList = await readPreferences('villager') ?? [];

      villagerByUser =
          villagerList.where((item) => auxList.contains(item.name)).toList();

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

  bool get hasSavedVillager => villagerByUser.isNotEmpty;

  int get villagerCount =>
      hasSavedVillager ? villagerByUser.length : villagerList.length;

  Villager getVillager(int index) =>
      hasSavedVillager ? villagerByUser[index] : villagerList[index];

  Future<bool> addVillagerUser(String name) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> listPreferences = prefs.getStringList('villager') ?? [];
    print(listPreferences.length);
    if (listPreferences.length == 10){
      return false;
    } else{
      listPreferences.add(name);
      prefs.setStringList('villager', listPreferences);
      villagerByUser
          .add(villagerList.where((villager) => villager.name == name).first);

      notifyListeners();
      
      return true;
    }
  }

  void removeVillagerUser(String name) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> listPreferences = prefs.getStringList('villager');

    listPreferences.remove(name);
    prefs.setStringList('villager', listPreferences);
    villagerByUser
        .remove(villagerList.where((villager) => villager.name == name).first);

    notifyListeners();
  }

  int isVillagerSaved(String name) => villagerByUser.where((villager) => villager.name == name).isEmpty ? 0 : 1;
}
