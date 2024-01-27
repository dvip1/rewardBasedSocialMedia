import 'dart:convert';

import 'package:client/services/shared_pref.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<http.Response> getData() async {
    String token = await SharedPref.getToken();
    Map<String, String> header = {"Authorization": "Bearer $token"};
    return http.get(Uri.parse("http://localhost:5000/user/myprofile"),
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
            } else if (snapshot.hasData && snapshot.data != null) {
              final body = jsonDecode(snapshot.data!.body);
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
                      CircleAvatar(
                          radius: 32,
                          child: Image(
                            image: NetworkImage(
                              body["profileImage"],
                            ),
                          ))
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
                          Text("KARMAS"),
                          Text(body["karmas"],
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("STREAKS"),
                          Text(body["streaks"],
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("CONNECTION"),
                          Text(body["karmas"],
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("POSTS"),
                          Text("23",
                              style: TextStyle(
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
                            onPressed: () {},
                            child: const Text("Edit Profile")),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text("Connect")),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.accessibility_sharp,
                          size: 36,
                        ),
                        Icon(
                          Icons.accessibility_sharp,
                          size: 36,
                        ),
                        Icon(
                          Icons.accessibility_sharp,
                          size: 36,
                        ),
                        Icon(
                          Icons.accessibility_sharp,
                          size: 36,
                        ),
                        Icon(
                          Icons.accessibility_sharp,
                          size: 36,
                        ),
                        Icon(
                          Icons.accessibility_sharp,
                          size: 36,
                        ),
                        Icon(
                          Icons.accessibility_sharp,
                          size: 36,
                        ),
                        Icon(
                          Icons.accessibility_sharp,
                          size: 36,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              );
            }
            return Center(
              child: Text(snapshot.error.toString()),
            );
          },
        ),
      ),
    );
  }
}
