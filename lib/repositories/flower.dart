import 'dart:convert';

import 'package:ACApp/repositories/base.dart';
import 'package:ACApp/services/api_service.dart';
import 'package:dio/dio.dart';
import '../models/index.dart';
import 'index.dart';

class FlowerRepository extends BaseRepository {
  Flower flower;

  @override
  Future loadData() async {
    // Try to load the data using [ApiService]
    try {
      final Response crossbreedingResponse = await ApiService.getCrossbreeding();

      //final crossbreedingDecoded = json.decode(crossbreedingResponse);
      
      flower = Flower.fromJson(crossbreedingResponse.data);

      finishLoading();
    } catch (e) {
      print(e);
      receivedError();
    }
  }
}
