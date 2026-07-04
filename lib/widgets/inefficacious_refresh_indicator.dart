import 'package:flutter/material.dart';
import 'package:cinemagic/constants/colors.dart';

class InefficaciousRefreshIndicator extends StatelessWidget {
  final Widget child;
  const InefficaciousRefreshIndicator({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 2250));
        },
        displacement: 50,
        backgroundColor: kSecondaryColor,
        color: Colors.white,
        child: child);
  }
}
