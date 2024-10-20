import 'package:flutter/material.dart';
import 'package:json_tutorial/utilities/UtilityFunctions.dart';
import 'Models/comment.dart';
import 'api/network_calls.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key, this.postId});

  final int? postId;

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  void initState() {
    super.initState();
    getComments();
  }

  List<Comment> comments = [];
  bool isLoading = true;

  getComments() async {
    dynamic response = await NetworkCalls().getCommentsByPost(widget.postId);
    List<Comment> commentsList = [];
    if (response != false) {
      print('its not false');
      commentsList = response.map<Comment>((json) {
        Comment comment = Comment.fromJson(json);
        return comment;
      }).toList();

      setState(() {
        comments = commentsList;
        isLoading = false;
      });
    } else {
      print('No Comments returned');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: const Text("Comments"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
      : comments.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child:const Text('This is all of the comments for the post',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),

                      ),
                    ),
              Column(
                children: comments.map((comment) {
                  return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 26, left: 10),
                      child: CircleAvatar(
                        backgroundColor: UtilityFunctions.getVibrantShade(comment.email![0]),
                        child: Text(
                          comment.email![0],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 46),
                      width: 35,
                      height: 2,
                      color: Colors.black54,
                    ),
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.fromLTRB(0, 16, 10, 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(14, 13, 3, 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                comment.email!,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(2, 4, 17, 10),
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    comment.body!.replaceAll('\n', ' '),
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                );}).toList()
                )]
            ))
          : const Center(
              child: Text(
              'No Comments',
              style: TextStyle(color: Colors.black38, fontSize: 25),
            )),
    );
  }
}
