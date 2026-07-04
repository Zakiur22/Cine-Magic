import 'package:get/get.dart';

class ProfileController extends GetxController {
  // User info
  late String name;
  late String username;
  late String imageUrl;
  void updateUserInfo({String? name, String? username, String? imageUrl}) {
    this.name = name ?? this.name;
    this.username = username ?? this.username;
    this.imageUrl = imageUrl ?? this.imageUrl;
    update();
  }

  String? nameErrorText;
  String? usernameErrorText;
  void updateTextFields(
      {final String? nameErrorText, final String? usernameErrorText}) {
    this.nameErrorText = nameErrorText ?? this.nameErrorText;
    this.usernameErrorText = usernameErrorText ?? this.usernameErrorText;
    update();
  }

  int watchedMoviesCount = 0;
  int watchedSeriesCount = 0;
  void updateWatchedMoviesCount(int count) {
    watchedMoviesCount = count;
    update();
  }

  void updateWatchedSeriesCount(int count) {
    watchedSeriesCount = count;
    update();
  }

  double imdbRatingAverage = 0;
  void updateImdbRatingAverage(double value) {
    imdbRatingAverage = value;
    update();
  }
}
