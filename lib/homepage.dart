import 'package:flutter/material.dart';
import 'package:json_tutorial/network_calls.dart';
import 'package:json_tutorial/user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;
  dynamic body = "";
  List<User> users = [];

  // void _incrementCounter() {
  //   setState(() {

  //     _counter++;
  //   });
  // }

  getUsers() async {
    dynamic responseType = await NetworkCalls().getUsers();

    if (responseType != false) {
      users = responseType.map<User>((json) {
        User user = User.fromJson(json);
        return user;
        // return User.fromJson(json);
      }).toList();

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          itemCount: users.length,
          itemBuilder: (context, int) {
            return users.isEmpty
                ? Container()
                : Row(
                    children: [
                      Text(users[int].id.toString()),
                      Text("   ${users[int].address!.geo!.lng}"),
                    ],
                  );
          }),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: getUsers,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
