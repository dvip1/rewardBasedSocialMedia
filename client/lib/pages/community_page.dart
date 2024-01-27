import 'package:client/Components/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
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
                  barRadius: const Radius.circular(20),
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: 0.9,
                  center: const Text("90.0%"),
                  progressColor: Theme.of(context).colorScheme.secondary),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 8),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Join Guild"),
                  )),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Members"),
                  )),
                ],
              ),
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
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton:
          ExpandableFab(type: ExpandableFabType.up, distance: 80, children: [
        FloatingActionButton.small(
          onPressed: () {
            showDialog(
              context: context,
              builder: (dialogContext) {
                return AlertDialog(
                  title: const Text("Add Memberers"),
                  content: const TextField(),
                  actions: [
                    TextButton(onPressed: () {}, child: const Text("Add"))
                  ],
                );
              },
            );
          },
          heroTag: "add members",
          child: const Icon(Icons.group),
        ),
        FloatingActionButton.small(
          onPressed: () {
            showDialog(
              context: context,
              builder: (dialogContext) {
                return AlertDialog(
                  title: const Text("add quest "),
                  content: const Wrap(
                    children: [TextField(), TextField()],
                  ),
                  actions: [
                    TextButton(onPressed: () {}, child: const Text("Add"))
                  ],
                );
              },
            );
          },
          heroTag: "add quests",
          child: const Icon(Icons.add),
        ),
      ]),
    );
  }
}
