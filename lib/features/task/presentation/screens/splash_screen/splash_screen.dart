import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/database/cache/cache_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

import '../../../../../core/utils/app_assets.dart';
import '../home_screen/home_screen.dart';
import '../on_boarding_screens/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    
    super.initState();
    navigate();
  }

void navigate() {
  bool isVisited= serviceLocatir<CacheHelper>().getData(key: AppStrings.onBoardingKey)??false;
  Future.delayed(const Duration(seconds: 4),(){       //isVisited? const HomeScreen():OnBoaringScreen())
      Navigator.push(context, MaterialPageRoute(builder: (_)=>isVisited? const HomeScreen():OnBoaringScreen()));
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.logo),
               SizedBox(height: 19.h,),
               Text(AppStrings.appName,style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 40.sp
               ),)
            ],
          ),
        ),
      );
  }
}