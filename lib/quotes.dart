// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Quotes extends StatelessWidget {
  String title;
  String auther;
  final int i;
  Function dTask;
  Quotes({
    super.key,
    required this.title,
    required this.auther,
    required this.i,
    required this.dTask,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      margin: const EdgeInsets.all(22),
      color: Colors.amberAccent,
      child: Column(children: [
        Text(
          title,
          textDirection: TextDirection.rtl,
          style: const TextStyle(fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(auther),
            IconButton(
              onPressed: () {
                dTask(i);
              },
              icon: const Icon(
                Icons.delete,
                size: 44,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
