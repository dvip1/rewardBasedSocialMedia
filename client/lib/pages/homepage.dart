import 'package:client/Components/post_widget.dart';
import 'package:client/pages/new_post.dart';
import 'package:client/services/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LinearPercentIndicator(
                      barRadius: const Radius.circular(20),
                      width: MediaQuery.of(context).size.width - 120,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2000,
                      percent: 0.9,
                      center: const Text("90.0%"),
                      progressColor: Theme.of(context).colorScheme.secondary),
                  const Text(
                    "LV:100",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )),
          PostWidget(
            authorId: 'trdt ',
            timestamps: '21:23',
            media:
                'http://192.168.78.217:5000/uploads/1706322507869-332083018.mp4',
            caption: 'this is a test caption',
          ),
          PostWidget(
            authorId: 'ebruifsd',
            timestamps: '01:23',
            media:
                'http://192.168.78.217:5000/uploads/1706322495652-177857509.mp4',
            caption: 'also new cew caption',
          ),
          PostWidget(
            authorId: 'ebruifsd',
            timestamps: '01:23',
            media:
                'http://192.168.78.217:5000/uploads/1706322495652-177857509.mp4',
            caption: 'also new cew caption',
          ),
          PostWidget(
            authorId: 'ebruifsd',
            timestamps: '01:23',
            media:
                'http://192.168.78.217:5000/uploads/1706327438458-92032677.mp4',
            caption: 'also new cew caption',
          ),
          PostWidget(
            authorId: 'ebruifsd',
            timestamps: '01:23',
            media:
                'http://192.168.78.217:5000/uploads/1706327449030-761753763.mp4',
            caption: 'also new cew caption',
          ),
        ],
      )),
    );
  }
}
