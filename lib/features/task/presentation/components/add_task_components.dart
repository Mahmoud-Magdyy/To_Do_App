import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_colors.dart';


class AddTaskComponent extends StatelessWidget {
  const AddTaskComponent({super.key, required this.title, required this.hintText,  this.controller, this.suffixIcon,this.readOnly=false, this.validator, this.maxLength});
  final String title;
  final String hintText;
  final int? maxLength;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final bool  readOnly ;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Text(title,style: Theme.of(context).textTheme.displayMedium,),
               SizedBox(height: 8.h,),
              TextFormField(
                style: const TextStyle(color: AppColors.white),
                readOnly: readOnly,
                controller: controller,
                validator: validator,
                maxLength: maxLength,
                decoration:   InputDecoration(
                
                  //hint
                  hintText: hintText,
                  suffixIcon: suffixIcon,
                ),
              ),
      ],
    );
  }
}