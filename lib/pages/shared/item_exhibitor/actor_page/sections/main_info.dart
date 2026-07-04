import 'package:flutter/material.dart';

class ActorPageMainInfo extends StatelessWidget {
  final String role;
  const ActorPageMainInfo({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: Text(role,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 15,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
