import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
      //scaffold theme
      scaffoldBackgroundColor: AppColors.background,
      //appBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        centerTitle: true,
      ),
      //text theme
      textTheme: TextTheme(
        displayLarge: GoogleFonts.lato(
          color: AppColors.white,
          fontWeight: FontWeight.w700,
          fontSize: 32,
        ),
        displayMedium: GoogleFonts.lato(
          color: AppColors.white,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        displaySmall: GoogleFonts.lato(
                                color: AppColors.white.withOpacity(0.44),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: AppColors.primary),  
                        
      ),

      inputDecorationTheme: InputDecorationTheme(
        //enabled border
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  //fouced border
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  //hint
                  hintStyle: GoogleFonts.lato(
          color: AppColors.white,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
                  fillColor: AppColors.lightBlack,
                  filled: true
      )
      
      );
}
