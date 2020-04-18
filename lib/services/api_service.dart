import 'package:dio/dio.dart';

import '../util/url.dart';
import '../models/index.dart';

/// Serves data to several data repositories.
///
/// Makes http calls to several services, including
/// the open source r/SpaceX REST API.
class ApiService {
  /// Retrieves cherry's changelog file from GitHub.
  static Future<Response<List>> getVillagers() async {
    return Dio().get(Url.villagerList);
  }

  static Future<Response> getVillager(String name) async {
    return Dio().get(Url.villager+name+Url.nookApi);
  }
}
