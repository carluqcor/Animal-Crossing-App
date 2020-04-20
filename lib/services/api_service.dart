import 'package:dio/dio.dart';

import '../util/url.dart';
import '../models/index.dart';

/// Serves data to several data repositories.
///
/// Makes http calls to several services, including
class ApiService {
  /// Retrieves cherry's changelog file from GitHub.
  static Future<Response> getVillagers() async {
    return Dio().get(Url.villagerList);
  }

  static Future<Response> getVillager(String name) async {
    return Dio().get(Url.villager+name+'/'+Url.nookApi);
  }

  static Future<Response> getCritters() async {
    return Dio().get(Url.critterList);
  }

  static Future<Response> getCritter(String name) async {
    return Dio().get(Url.critter+name+'/'+Url.nookApi);
  }
}

