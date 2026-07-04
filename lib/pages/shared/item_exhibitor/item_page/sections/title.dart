import 'package:flutter/material.dart';

class ItemPageTitle extends StatelessWidget {
  final String title;
  const ItemPageTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w700)),
    );
  }
}
