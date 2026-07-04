import 'package:flutter/material.dart';
import 'package:cinemagic/constants/types.dart';
import 'package:cinemagic/pages/shared/item_exhibitor/item_box/expanded_item_box/expanded_item_box.dart';
import 'package:cinemagic/widgets/inefficacious_refresh_indicator.dart';

class EpisodeGuideSeasonEpisodes extends StatelessWidget {
  final int season;
  final dynamic show;
  const EpisodeGuideSeasonEpisodes(
      {super.key, required this.season, required this.show});

  @override
  Widget build(BuildContext context) {
    return InefficaciousRefreshIndicator(
      child: ListView.builder(
        itemCount: show.seasons[season].length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, episode) {
          return ExpandedItemBox(
            show: show.seasons[season][episode],
            preTag: "episode",
            showType: ItemSuit.EPISODE,
          );
        },
      ),
    );
  }
}
