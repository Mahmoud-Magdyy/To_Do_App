import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CustomElevetedButton extends StatelessWidget {
  CustomElevetedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = AppColors.primary});
  final String text;
  final VoidCallback onPressed;
  Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
          backgroundColor: MaterialStatePropertyAll(backgroundColor)
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.lato(
            color: AppColors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
        ));
  }
}
