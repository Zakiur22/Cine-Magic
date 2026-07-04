import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movielab/modules/tools/capitalizer.dart';
import 'package:movielab/modules/tools/navigate.dart';
import 'package:movielab/pages/main/profile/sections/list_page/sections/stats_page/stats.dart';
import 'package:movielab/pages/shared/about_recommendations_page/about_recommendations.dart';

AppBar listPageNavbar(context, {required final String listName}) {
  return AppBar(
    centerTitle: false,
    leading: IconButton(
      icon: const FaIcon(
        FontAwesomeIcons.arrowLeft,
        color: Colors.white,
        size: 22.5,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Row(
      children: [
        Text(listName.capitalize(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ],
    ),
    actions: [
      IconButton(
        icon: listName == "recommendations"
            ? const Icon(
                Icons.more_horiz_rounded,
                size: 30,
              )
            : const FaIcon(
                FontAwesomeIcons.squarePollVertical,
                size: 24,
              ),
        onPressed: () {
          Navigate.pushTo(
              context,
              listName == "recommendations"
                  ? const AboutRecommendationsPage()
                  : ListStatsPage(
                      listName: listName,
                    ));
        },
      ),
    ],
  );
}
