import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_tutorial/user.dart';

// get
// post
// put
// delete
late Address address;
late Company company;

class NetworkCalls {

  Future<dynamic> getUsers() async {
    try {

      http.Response response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return false;
      }
    } catch (e) {
      // return e;
      print(e);
      return false;
    }
  }
}
