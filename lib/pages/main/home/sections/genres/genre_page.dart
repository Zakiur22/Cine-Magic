import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:cinemagic/constants/colors.dart';
import 'package:cinemagic/constants/types.dart';
import 'package:cinemagic/models/item_models/show_models/show_preview_model.dart';
import 'package:cinemagic/modules/api/api_requester.dart';
import 'package:cinemagic/pages/main/home/home_data_controller.dart';
import 'package:cinemagic/pages/shared/item_exhibitor/item_box/expanded_item_box/expanded_item_box.dart';
import 'package:cinemagic/widgets/inefficacious_refresh_indicator.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({super.key, required this.genre});
  final String genre;

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  List<ShowPreview> items = [];
  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeDataController>(
      builder: (_) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.white,
                    size: 22.5,
                  )),
              backgroundColor: kBlueColor,
              title: Text("Popular ${widget.genre}s",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
            body: SafeArea(
              child: ListView(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: items.isNotEmpty
                        ? InefficaciousRefreshIndicator(
                            child: ListView.builder(
                              itemCount: items.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ExpandedItemBox(
                                  show: items[index],
                                  showType: ItemSuit.OFFICIAL_LIST,
                                );
                              },
                            ),
                          )
                        : const Center(
                            child: SpinKitThreeBounce(
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                  )
                ],
              ),
            ));
      },
    );
  }

  void getItems() {
    APIRequester apiRequester = APIRequester();
    apiRequester.getGenreItems(genre: widget.genre).then((value) {
      setState(() {
        items = value!;
      });
    });
  }
}
