import 'package:ACApp/repositories/base.dart';
import 'package:ACApp/services/api_service.dart';
import 'package:dio/dio.dart';
import '../models/index.dart';

class FossilRepository extends BaseRepository {
  List<Fossil> fossilList = [];
  List<String> fossilListName = [];
  Fossil fossil;
  Fossils fossils;

  @override
  Future<void> loadData() async {
    // Try to load the data using [ApiService]
    try {
      // Receives the data and parse it
      final Response fossilsResponse = await ApiService.getFossils();

      fossils = Fossils.fromJson(fossilsResponse.data);
      
      for (int x = 0; x < fossils.fossils.length; x++) {
        final Response fossil =
          await ApiService.getFossil(fossils.fossils[x]['title']);
        fossilList.add(Fossil.fromJson(fossil.data));
      }

      finishLoading();
    } on DioError catch (e) {
      print(e);
      receivedError();
    }
  }

  Fossil getFossil(int index) => fossilList[index];

}
