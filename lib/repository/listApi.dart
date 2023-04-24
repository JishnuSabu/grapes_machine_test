import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machine_test/model/listmodel.dart';

class ListApi {

  static const String urlENDPOINT = "https://jsonplaceholder.typicode.com/users";

  final client = http.Client();

  late List<ListModel> listModel;

  Future<List<ListModel>> getListItems() async {
    try {
      final request = await client.get(Uri.parse(urlENDPOINT));
      if (request.statusCode == 200) {
        final response = json.decode(request.body);
        listModel = (response as List).map((e) => ListModel.fromJson(e)).toList();
        // listModel = ListModel.fromJson(response);
      }
    } catch (e) {
      throw Exception(e);
    }
    return listModel;
  }
}
