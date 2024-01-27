import 'dart:convert';

import 'package:client/Components/profile_post.dart';
import 'package:client/services/shared_pref.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<http.Response> getPosts() async {
    String token = await SharedPref.getToken();
    Map<String, String> header = {"Authorization": "Bearer $token"};
    return http.get(Uri.parse("http://192.168.78.217:5000/post/myposts"),
        headers: header);
  }

  Future<http.Response> getData() async {
    String token = await SharedPref.getToken();
    Map<String, String> header = {"Authorization": "Bearer $token"};
    return http.get(Uri.parse("http://192.168.78.217:5000/user/myprofile"),
        headers: header);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
      child: SingleChildScrollView(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.data == null) {
              return const Center(
                child: Text("no data found"),
              );
            }
            final body = jsonDecode(snapshot.data!.body);
            print(body);
            int postC = (body["posts"] as List).length;
            int conC = (body["connections"] as List).length;
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          body["username"],
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          body["email"],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const CircleAvatar(radius: 32, child: Text("ifb")
                        // Image(
                        //   image: NetworkImage(
                        //     body["profileImage"],
                        //   ),
                        // )
                        )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text("KARMAS"),
                        Text("${body["karmas"]}",
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("STREAKS"),
                        Text("${body["streaks"]}",
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("CONNECTION"),
                        Text("$conC",
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("POSTS"),
                        Text("$postC",
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Edit Profile")),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Connect")),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                FutureBuilder(
                  future: getPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.data == null) {
                      return const Center(
                        child: Text("no data found"),
                      );
                    }

                    var data = jsonDecode(snapshot.data!.body) as List;
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ProfilePost(
                          media: data[index]["media"],
                        );
                      },
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
