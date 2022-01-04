import 'dart:convert';
import 'package:http/http.dart';
import 'package:mobileprojet/models/categories.dart';

class ApiServiceCat {
  final String apiUrl = "http://192.168.43.54:3000/api/category";

  Future<List<Categories>> getCat() async {
    Response res = await get(apiUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Categories> categories = body.map((dynamic item) => Categories.fromJson(item)).toList();
      return categories;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Categories> getCaseById(String id) async {
    final response = await get('$apiUrl/$id');

    if (response.statusCode == 200) {
      return Categories.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

  Future<Categories> createCase(Categories categories) async {
    Map data = {
      'nomcat': categories.nomcat,
      
    };

    final Response response = await post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Categories.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  Future<Categories> updateCases(String id, Categories categories) async {
    Map data = {
      'nomcat': categories.nomcat,
     
    };

    final Response response = await put(
      '$apiUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Categories.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a case');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await delete('$apiUrl/$id');

    if (res.statusCode == 200) {
      print("Case deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }

}
