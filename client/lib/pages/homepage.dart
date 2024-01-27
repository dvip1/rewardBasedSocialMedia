import 'package:client/Components/post_widget.dart';
import 'package:client/pages/new_post.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          const PostWidget(),
          // const PostWidget(),
          // const PostWidget(),
          // const PostWidget(),
        ],
      )),
    );
  }
}
