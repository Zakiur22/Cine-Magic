import 'package:flutter/material.dart';
import 'package:cinemagic/constants/user_lists.dart';
import 'package:cinemagic/modules/tools/navigate.dart';
import 'package:cinemagic/pages/main/profile/sections/list_page/list_page.dart';
import 'package:cinemagic/widgets/buttons_section.dart';
import 'package:cinemagic/modules/tools/capitalizer.dart';
import 'package:cinemagic/widgets/section_title.dart';

class ProfilePageLists extends StatelessWidget {
  const ProfilePageLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(
          title: 'Lists',
          fontSize: 22.5,
          fontWeight: FontWeight.w700,
          padding: EdgeInsets.only(bottom: 12.5),
        ),
        ButtonsSection(
          height: 500,
          items: [
            for (Map<String, dynamic> list in userLists)
              ButtonSectionItem(
                title: list["name"] != "recommendations"
                    ? list["name"].toString().capitalize()
                    : "${list["name"].toString().capitalize()} for you",
                icon: list["icon"],
                iconColor: list["color"],
                iconPadding: list["padding"],
                onPressed: () {
                  Navigate.pushTo(context, ListPage(listName: list["name"]));
                },
              ),
          ],
        )
      ],
    );
  }
}
