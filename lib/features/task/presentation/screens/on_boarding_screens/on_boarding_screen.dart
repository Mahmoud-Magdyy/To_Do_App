import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/database/cache/cache_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_eleveted_button.dart';
import 'package:to_do_app/features/auth/data/model/on_boarding_model.dart';

import '../../../../../core/widgets/custom_text_button.dart';
import '../home_screen/home_screen.dart';


class OnBoaringScreen extends StatelessWidget {
  OnBoaringScreen({super.key});
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: OnBoaringModel.OnBoaringScreens.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        //skip text
                        index != 2
                            ? CustomTextButton(
                                text: AppStrings.skip,
                                onPressed: () {
                                  controller.jumpToPage(2);
                                },
                              )
                            
                            : const SizedBox(
                                height: 54,
                              ),
                        const SizedBox(
                          height: 15,
                        ),
                        //image
                        Image.asset(
                            OnBoaringModel.OnBoaringScreens[index].imagePath),
                        const SizedBox(
                          height: 16,
                        ),
                        //dotts
                        SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: const ExpandingDotsEffect(
                              activeDotColor: AppColors.primary,
                              dotHeight: 10,
                              spacing: 8),
                        ),

                        const SizedBox(
                          height: 50,
                        ),
                        //title

                        Text(
                          OnBoaringModel.OnBoaringScreens[index].title,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(
                          height: 42,
                        ),
                        //subtitle

                        Text(
                          OnBoaringModel.OnBoaringScreens[index].subTitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        //buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //back button
                            index != 0
                                ? CustomTextButton(
                                    text: AppStrings.back,
                                    onPressed: () {
                                      controller.previousPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve:
                                              Curves.fastEaseInToSlowEaseOut);
                                    })
                                : Container(),
                            //next button
                            index != 2
                                ? 
                                CustomElevetedButton(text: AppStrings.next, onPressed: () {
                                      controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve:
                                              Curves.fastEaseInToSlowEaseOut);
                                    })
                                
                                : 
                                CustomElevetedButton(text: AppStrings.getStarted, onPressed: () async {
                                      await serviceLocatir<CacheHelper>()
                                          .saveData(
                                              key: AppStrings.onBoardingKey,
                                              value: true)
                                          .then((value) => {
                                                print('is vailable'),
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            const HomeScreen()))
                                              });
                                    },)
                                
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
