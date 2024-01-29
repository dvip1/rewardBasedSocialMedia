import 'package:client/Components/task.dart';
import 'package:flutter/material.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return TaskWidget(
                id: '',
                name: 'PushUps',
                des: '78k peoples have completed this.',
              );
            },
          )),
    );
  }
}
