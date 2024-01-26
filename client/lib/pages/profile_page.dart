import 'package:client/pages/signin_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Username",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 32,
                  child: Text("T"),
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ));
                  },
                  child: const Text("Edit Profile")),
            ),
          ],
        ),
      ),
    );
  }
}
