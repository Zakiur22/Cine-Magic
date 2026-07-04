import 'package:flutter/material.dart';
import 'package:cinemagic/models/item_models/show_models/full_show_model.dart';
import 'package:cinemagic/widgets/section_title.dart';

class ItemPageKeywords extends StatelessWidget {
  final FullShow show;
  const ItemPageKeywords({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return show.tagline != "" || show.keywords != ""
        ? Column(
            children: [
              const SectionTitle(title: "Keywords"),
              Column(
                children: [
                  show.tagline.isNotEmpty
                      ? Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(show.tagline,
                                    softWrap: true,
                                    style: TextStyle(
                                        color: Colors.white.withValues(alpha: 0.6),
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.w500)),
                              ),
                            )
                          ],
                        )
                      : const SizedBox(),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(show.keywords,
                              softWrap: true,
                              style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.6),
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
