import 'dart:convert';
import 'package:http/http.dart';
import 'package:mobileprojet/models/transaction.dart';


class ApiTrans {
  final String apiUrl = "http://192.168.43.54:3000/api/transaction";

  Future<List<Transaction>> getCat() async {
    Response res = await get(apiUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Transaction> transaction = body.map((dynamic item) => Transaction.fromJson(item)).toList();
      return transaction;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Transaction> getCaseById(String id) async {
    final response = await get('$apiUrl/$id');

    if (response.statusCode == 200) {
      return Transaction.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

  Future<Transaction> createCase(Transaction transaction) async {
    Map data = {
       //'day': transaction.day,
       'montant':transaction.montant,
       'descriptions':transaction.descriptions,
       'type':transaction.type
      
 
    };

    final Response response = await post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Transaction.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post Transaction');
    }
  }

  Future<Transaction> updateCases(String id, Transaction transaction) async {
    Map data = {
       'day': transaction.day,
       'montant':transaction.montant,
       'descriptions':transaction.descriptions,
       'type':transaction.type
     
    };

    final Response response = await put(
      '$apiUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Transaction.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a Transaction');
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
