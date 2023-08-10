
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

void navigate({required BuildContext context,required Widget screen}){
  Navigator.push(context, MaterialPageRoute(builder: (_)=>screen));
}

void showTwist({required String messege,required ToastStates state}){
  Fluttertoast.showToast(
        msg: messege,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: getState(state),
        textColor: Colors.white,
        fontSize: 16.0
    );
}
enum ToastStates{error,success,warning,}
Color getState(ToastStates  state) {
  switch (state) {
    case ToastStates.error:return AppColors.red;
    case ToastStates.success:return AppColors.primary;
    case ToastStates.warning:return AppColors.orange;
  }
}