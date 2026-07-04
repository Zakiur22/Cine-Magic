import 'package:flutter/material.dart';

class ActorPageTitle extends StatelessWidget {
  final String name;
  const ActorPageTitle({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(name,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700)),
    );
  }
}
