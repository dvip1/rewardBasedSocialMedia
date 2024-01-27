import 'package:client/Components/task.dart';
import 'package:flutter/material.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
                child: TaskWidget(
                  id: '',
                  name: 'PushUps',
                  des: '78k peoples have completed this.',
                ),
              );
            },
          )),
    );
  }
}
