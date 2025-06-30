import 'package:flutter/material.dart';

class ParentInfoWidget extends StatelessWidget {
  const ParentInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Parent: Luis López',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}
