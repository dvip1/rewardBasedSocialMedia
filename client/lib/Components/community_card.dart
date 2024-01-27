import 'package:client/pages/community_page.dart';
import 'package:flutter/material.dart';

class CommunityWidget extends StatefulWidget {
  String name;
  String image;
  String desc;
  CommunityWidget(
      {super.key, required this.name, required this.desc, required this.image});

  @override
  State<CommunityWidget> createState() => _CommunityWidgetState();
}

class _CommunityWidgetState extends State<CommunityWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CommunityPage(),
            ));
      },
      child: Card(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    radius: 34,
                    child: Text("D"),
                  ),
                  title: Text(widget.name,
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w500)),
                  subtitle: Text(widget.desc,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
