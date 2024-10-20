import 'package:flutter/material.dart';
import 'package:json_tutorial/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Tutorial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    // initialRoute: Constants.homeRoute,
    //   routes: _buildAppRoutes(),
    );
  }

  // Map<String, WidgetBuilder> _buildAppRoutes(){
  //   return {
  //     Constants.homeRoute: (context) => const MyHomePage(),
  //
  //     Constants.postsRouts: (context) {
  //       final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  //       return PostsPage(
  //         uid: args['uid'],
  //         name: args['name'],
  //         email: args['email'],
  //       );
  //     },
  //
  //     Constants.commentsRoute: (context) {
  //       final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  //       return CommentsPage(
  //         postId: args['postId'],
  //       );
  //     }
  //
  //   };
  // }
}
