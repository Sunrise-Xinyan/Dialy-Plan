import 'package:flutter/material.dart';

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('学习记录'),
      ),
      body: const Center(
        child: Text('学习记录功能（与运动记录类似）'),
      ),
    );
  }
}
