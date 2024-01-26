import 'package:client/Components/task.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Guild Name",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const Text(
              "this is a test community description to check.",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: LinearPercentIndicator(
                  barRadius: Radius.circular(20),
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: 0.9,
                  center: const Text("90.0%"),
                  progressColor: Theme.of(context).colorScheme.secondary),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24, bottom: 8),
              child: Text(
                "Quests",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return const TaskWidget();
              },
            )
          ]),
        ),
      ),
    );
  }
}
