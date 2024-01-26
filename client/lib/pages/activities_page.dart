import 'package:client/Components/community.dart';
import 'package:client/Components/task.dart';
import 'package:flutter/material.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 22, bottom: 16),
              child: Text(
                "Guilds",
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 400,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CommunityWidget();
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 34, bottom: 16),
              child: Text(
                "Quests",
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 400,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return const TaskWidget();
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
