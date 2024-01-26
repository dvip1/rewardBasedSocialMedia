import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Row(
          children: [
            const Expanded(
                child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  child: Text("T"),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "username",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text("12/3/24 at 12:12")
                  ],
                )
              ],
            )),
            PopupMenuButton(
              itemBuilder: (context) {
                return [];
              },
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 56,
          child: const Text(
              "this is a long cation to display caption diufw fw fkjdfb sfj fhfwf bsfusf shhfw bf",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        ),
        const SizedBox(
          height: 18,
        ),
        Card(
          child: SizedBox(
            height: 350,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
                label: const Text("100 likes"),
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  size: 32,
                )),
            ElevatedButton.icon(
                label: const Text("10 dislikes"),
                onPressed: () {},
                icon: const Icon(
                  Icons.heart_broken,
                  size: 32,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment,
                  size: 32,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  size: 32,
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.grey,
        )
      ]),
    );
  }
}
