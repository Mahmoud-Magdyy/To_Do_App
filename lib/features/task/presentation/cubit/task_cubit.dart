import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_state.dart';

import '../../../../core/utils/app_colors.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  DateTime currentDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());

  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
  int currentIndex = 0;
  void GetDate(context) async {
    emit(GetDateLoading());
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      currentDate = pickedDate;
      emit(GetDateSuccess());
    } else {
      print('pickedDate==null');
      emit(GetDateError());
    }
  }

  void getStartDate(context) async {
    emit(GetStartDateLoading());
    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedStartTime != null) {
      startTime = pickedStartTime.format(context);
      emit(GetStartDateSuccess());
    } else {
      print('pickedStartTime==null');
      emit(GetStartDateError());
    }
  }

  void getEndDate(context) async {
    emit(GetEndDateLoading());
    TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedEndTime != null) {
      endTime = pickedEndTime.format(context);
      emit(GetEndDateSuccess());
    } else {
      print('pickedEndTime==null');
      emit(GetEndDateError());
    }
  }

  Color getColor(index) {
    emit(GetColorState());
    switch (index) {
      case 0:
        return AppColors.red;
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.blueGrye;
      case 3:
        return AppColors.blue;
      case 4:
        return AppColors.orange;
      case 5:
        return AppColors.purple;
      default:
        return AppColors.grey;
    }
  }

  void changeCheckMarkIndex(index) {
    emit(ChangeCheckMarkIndexState());
      currentIndex = index;
    
  }
}
