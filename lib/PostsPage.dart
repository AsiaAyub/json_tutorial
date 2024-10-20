import 'package:flutter/material.dart';
import 'package:json_tutorial/CommentsPage.dart';
import 'package:json_tutorial/utilities/UtilityFunctions.dart';
import 'Models/post.dart';
import 'api/network_calls.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key, this.uid, this.name, this.email});

  final int? uid;
  final String? name;
  final String? email;

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  // fetches data and sets up everything upon creation
  @override
  void initState() {
    super.initState();
    getPosts();
  }

  List<Post> posts = [];

  bool isLoading = true;
  getPosts() async {
    dynamic responseType = await NetworkCalls().getPostsByUser(widget.uid);
    List<Post> postsList = [];

    if (responseType != false) {
      postsList = responseType.map<Post>((json) {
        Post post = Post.fromJson(json);
        return post;
      }).toList();

      setState(() {
        posts = postsList;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String? name = widget.name;
    List<String> fullName = [];
    name!.contains(' ') ? fullName = name.split(' ') : print('');

    fullName.isNotEmpty ? name = '${fullName[0]} ${fullName[1]}' : name = name;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      appBar: AppBar(
        title: Text("$name's Posts"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                  children: posts.map((post) {
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(23, 20, 23, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.purpleAccent.withOpacity(0.05),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.withOpacity(0.5),
                              width: 1.0,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.fromLTRB(9, 2, 5, 0),
                          title: Text(
                            UtilityFunctions.capitalizeEachWord(post.title!),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            widget.email!,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black45),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 17, 15, 25),
                        child: Text(
                          post.body!.replaceAll('\n', ' '),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      InkWell(
                        highlightColor: Colors.purple,
                        splashColor: Colors.purple,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommentsPage(
                                        postId: post.id,
                                      )));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            border: Border(
                              top: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Comments',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Icon(Icons.comment)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }).toList()),
            ),
    );
  }
}
