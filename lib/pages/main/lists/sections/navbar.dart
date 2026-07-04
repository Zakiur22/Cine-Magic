import 'package:flutter/material.dart';
import 'package:cinemagic/constants/colors.dart';

AppBar UserListsNavbar() {
  return AppBar(
    backgroundColor: kSecondaryColor,
    toolbarHeight: 65,
    centerTitle: true,
    automaticallyImplyLeading: false,
    title: TabBar(
      unselectedLabelColor: Colors.grey.withValues(alpha: 0.5),
      splashFactory: NoSplash.splashFactory,
      overlayColor:
          WidgetStateColor.resolveWith((states) => Colors.transparent),
      physics: const BouncingScrollPhysics(),
      indicatorColor: Colors.transparent,
      tabs: const [
        Tab(
            child: Text(
          "Watchlist",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        Tab(
            child: Text(
          "History",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        Tab(
            child: Text(
          "Collection",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
      ],
    ),
  );
}
