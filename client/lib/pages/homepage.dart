import 'dart:convert';

import 'package:client/Components/post_widget.dart';
import 'package:client/pages/new_post.dart';
import 'package:client/services/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<http.Response> getPosts() async {
    String token = await SharedPref.getToken();
    Map<String, String> header = {"Authorization": "Bearer $token"};
    return http.get(Uri.parse("http://192.168.78.217:5000/post/myposts"),
        headers: header);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 75,
        width: 75,
        child: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const NewPostWidget();
                },
              ));
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: getPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            List data = jsonDecode(snapshot.data!.body);
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return PostWidget(
                  authorId: data[index]["user"],
                  timestamps: data[index]["createdAt"],
                  media: data[index]["media"],
                  caption: data[index]["caption"],
                  likes: "${data[index]["likes"]}",
                  dislikes: "2",
                );
              },
            );
          }
          return Text(snapshot.error.toString());
        },
      )),
    );
  }
}
