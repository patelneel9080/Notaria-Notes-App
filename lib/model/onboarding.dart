

import 'package:bottam/Images/images.dart';
import 'package:bottam/config/app_constant.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnBoardingModel(
      {required this.image, required this.subTitle, required this.title});
}

List<OnBoardingModel> onBoardingScreen = [
  OnBoardingModel(
      image: BackgroundImg.bkg1,
      subTitle: "I provide essential stuff for your ui designs every tuesday!",
      title: "Welcome $UserId !!"),
  OnBoardingModel(
      image: BackgroundImg2.trio,
      subTitle: "Make sure to take a look on your assistant",
      title: "Uploads Every Day Quotes For You!"),

];
