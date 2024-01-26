import 'package:client/pages/new_post.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return AlertDialog(
              title: const Text("Create Post"),
              content:
                  const Text("do you want  to create post on this quest ?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                    },
                    child: const Text("No")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const NewPostWidget();
                        },
                      ));
                    },
                    child: const Text("Yes"))
              ],
            );
          },
        );
      },
      child: Card(
        child: SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Community Name",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  "85k peoples completed",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
