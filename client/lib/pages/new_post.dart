import 'package:flutter/material.dart';

class NewPostWidget extends StatelessWidget {
  const NewPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("create post"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(hintText: "Caption"),
              ),
              const SizedBox(
                height: 18,
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("select video"))
            ],
          ),
        ),
      ),
    );
  }
}
