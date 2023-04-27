import 'dart:convert';
import 'package:lisapicall/Model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UsersModel>> getdata() async {
    String url = 'https://jsonplaceholder.typicode.com/users';
    var response = await http.get(Uri.parse(url));
    var result = (jsonDecode(response.body) as List)
        .map((user) => UsersModel.fromJson(user as Map<String, dynamic>))
        .toList();
    return result;
  }
}
