import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../util/url.dart';
import '../models/index.dart';

/// Serves data to several data repositories.
///
/// Makes http calls to several services, including
class ApiService {
  /// Retrieves cherry's changelog file from GitHub.

  static Future<Response> getVillager() async {
    return Dio().get(Url.villager+'/'+Url.nookApi+'&input=all');
  }

  static Future<Response> getCritters() async {
    return Dio().get(Url.critterList);
  }

  static Future<Response> getCritter(String name) async {
    return Dio().get(Url.critter+name+'/'+Url.nookApi);
  }

  static Future<Response> getTodayResponse() async {
    return Dio().get(Url.todayMessage+Url.nookApi);
  }

  static Future<Response> getFossils() async {
    return Dio().get(Url.fossilList);
  }

  static Future<Response> getFossil(String name) async {
    return Dio().get(Url.fossil+name+'/'+Url.nookApi);
  }
  /*static Future<String> getCrossbreeding() async {
    return await rootBundle.loadString('assets/crossbreeding.json');
  }*/
  static Future<Response> getCrossbreeding() async {
    return Dio().get(Url.flowers);
  }
}

