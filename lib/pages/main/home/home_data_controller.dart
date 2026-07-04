import 'package:get/get.dart';
import 'package:cinemagic/models/item_models/show_models/show_preview_model.dart';

class HomeDataController extends GetxController {
  List<ShowPreview> trendingMovies = [];
  void updateTrendingMovies({required List<ShowPreview> trendingMovies}) {
    this.trendingMovies = trendingMovies;
    update();
  }

  List<ShowPreview> trendingShows = [];
  void updateTrendingShows({required List<ShowPreview> trendingShows}) {
    this.trendingShows = trendingShows;
    update();
  }

  List<ShowPreview> inTheaters = [];
  void updateInTheaters({required List<ShowPreview> inTheaters}) {
    this.inTheaters = inTheaters;
    update();
  }

  List<ShowPreview> topRatedMovies = [];
  void updateTopRatedMovies({required List<ShowPreview> topRatedMovies}) {
    this.topRatedMovies = topRatedMovies;
    update();
  }

  List<ShowPreview> topRatedShows = [];
  void updateTopRatedShows({required List<ShowPreview> topRatedShows}) {
    this.topRatedShows = topRatedShows;
    update();
  }

  List<ShowPreview> recommendations = [];
  void updateRecommendations({required List<ShowPreview> recommendations}) {
    this.recommendations = recommendations;
    update();
  }

  List<Map<String, List<ShowPreview>>> companiesinfo = [];
  void updateCompaniesInfo(
      {required List<Map<String, List<ShowPreview>>> companiesinfo}) {
    this.companiesinfo = companiesinfo;
    update();
  }

  void addCompanyInfo({required Map<String, List<ShowPreview>> companyinfo}) {
    companiesinfo.add(companyinfo);
    update();
  }

  List<ShowPreview> boxOffice = [];
  void updateBoxOffice({required List<ShowPreview> boxOffice}) {
    this.boxOffice = boxOffice;
    update();
  }

  List<ShowPreview> allTimeBoxOffice = [];
  void updateAllTimeBoxOffice({required List<ShowPreview> allTimeBoxOffice}) {
    this.allTimeBoxOffice = allTimeBoxOffice;
    update();
  }
}
