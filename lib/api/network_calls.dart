import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_tutorial/Models/user.dart';

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

  Future<dynamic> getPostsByUser(int? id) async {
    try {

      http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      if (response.statusCode == 200) {

        List<dynamic> posts = jsonDecode(response.body);

        List<dynamic> userPosts = posts.where((post) => post['userId'] == id).toList();

        return userPosts;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> getCommentsByPost (int? postId) async {
     try{
       http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));

       if(response.statusCode == 200){

         List<dynamic> comments = jsonDecode(response.body);
         List<dynamic> postComments = comments.where((comment) => comment['postId'] == postId).toList();
         return postComments;

       }
       else{
         return false;
       }
     }catch(e){
       return e;
     }

  }



}
