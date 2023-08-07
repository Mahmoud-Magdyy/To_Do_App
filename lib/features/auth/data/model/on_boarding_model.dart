import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';

class OnBoaringModel {
  final String imagePath;
  final String title;
  final String subTitle;

  OnBoaringModel({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  }
  
  );

  static List<OnBoaringModel> OnBoaringScreens=[
    OnBoaringModel(imagePath: AppAssets.on1, title: AppStrings.onBoardingTitleOne, subTitle: AppStrings.onBoardingSubTitleOne),   
    OnBoaringModel(imagePath: AppAssets.on2, title: AppStrings.onBoardingTitleTwo, subTitle: AppStrings.onBoardingSubTitleTwo),   
    OnBoaringModel(imagePath: AppAssets.on3, title: AppStrings.onBoardingTitleThree, subTitle: AppStrings.onBoardingSubTitleThree),   
   ];
}