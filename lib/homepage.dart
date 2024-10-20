import 'package:flutter/material.dart';
import 'package:json_tutorial/PostsPage.dart';
import 'package:json_tutorial/api/network_calls.dart';
import 'package:json_tutorial/Models/user.dart';
import 'package:json_tutorial/utilities/UtilityFunctions.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  List<User> users = [];


  bool isLoading = true;
  getUsers() async {
    dynamic responseType = await NetworkCalls().getUsers();
    List<User> userList = [];


    if (responseType != false) {
      userList = responseType.map<User>((json) {
        User user = User.fromJson(json);
        return user;

      }).toList();

      setState(() {
        users = userList;
        isLoading = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Json Holder Home Page'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          :SingleChildScrollView(
          child: Column(children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          padding: const EdgeInsets.fromLTRB(20, 7, 10, 10),
          child: const Text(
            'All Users',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black54),
          ),
        ),
        Column(
          children: users.map((user) {
            return Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 5, 0),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent.withOpacity(0.05),
                  border: Border(
                    bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.0,
                  ),
                    left: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                    right: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(8.0),

                ),
                child: ListTile(

                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        PostsPage(uid: user!.id, name: user!.name, email: user!.email,)));
                  },
                  splashColor: Colors.purple,
                  leading: CircleAvatar(
                    backgroundColor: UtilityFunctions.getVibrantShade(user.name![0]),
                    child: Text(
                      user.name![0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text('${user.name}'),
                  subtitle: Text('${user.email}'),
                ));
          }).toList(),
        ),
      ])),
    );
  }
}
