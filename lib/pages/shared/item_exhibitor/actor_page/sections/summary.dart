import 'package:flutter/material.dart';
import 'package:movielab/widgets/section_title.dart';

class ActorPageSummary extends StatelessWidget {
  final String summary;
  const ActorPageSummary({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: "Biography"),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: Text(summary,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.55),
                  fontSize: 15,
                  fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
