import 'dart:convert';

import 'package:ACApp/repositories/base.dart';
import 'package:ACApp/services/api_service.dart';
import 'package:dio/dio.dart';
import '../models/index.dart';
import 'index.dart';

class FlowerRepository extends BaseRepository {
  List<Flower> flowers = [];

  @override
  Future loadData() async {
    // Try to load the data using [ApiService]
    try {
      final Response crossbreedingResponse = await ApiService.getCrossbreeding();

      flowers = [for (final flower in crossbreedingResponse.data) Flower.fromJson(flower)];
      
      print('WGWOGWRGWOGWPGVNWG');
      print(flowers);

      finishLoading();
    } catch (e) {
      print(e);
      receivedError();
    }
  }
}
