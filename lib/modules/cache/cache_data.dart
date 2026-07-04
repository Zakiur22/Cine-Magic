import 'package:get/get.dart';
import 'package:cinemagic/models/item_models/actor_models/full_actor_model.dart';
import 'package:cinemagic/models/item_models/show_models/full_show_model.dart';

class CacheData extends GetxController {
  List<FullShow> showsData = [];
  List<FullActor> actorsData = [];
  List<Map> companiesData = [];

  void addShowData({required FullShow show}) {
    showsData.add(show);
    update();
  }

  void addActorData({required FullActor actor}) {
    actorsData.add(actor);
    update();
  }

  void addCompanyData({required Map company}) {
    companiesData.add(company);
    update();
  }
}
