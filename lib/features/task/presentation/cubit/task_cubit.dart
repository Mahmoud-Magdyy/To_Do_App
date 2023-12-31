import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/database/sqflite_helper/sqflite.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_state.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/mode/task_model.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());

  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
  int currentIndex = 0;
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
 
    currentIndex = index;
    print(currentIndex);
       emit(ChangeCheckMarkIndexState());
  }

  void getSelectedDate(date) {
    emit(GetSelectedDateLoadigState());
    selectedDate = date;
    emit(GetSelectedDateSuccessState());
    getTasks();
  }

  List<TaskModel> tasksList = [];

  void insetTask() async {
    emit(InsertTaskLoadingState());

    try {
      //  await Future.delayed(const Duration(seconds:1));
      print(currentIndex);
      await serviceLocatir<SqfliteHelper>().inserrToDB(
        TaskModel(
            date: DateFormat.yMd().format(currentDate),
            color: currentIndex,
            title: titleController.text,
            note: noteController.text,
            startTime: startTime,
            endTime: endTime,
            isCompleted: 0),
      );
      getTasks();

      //!insert

      //  await Future.delayed(const Duration(seconds: 3));
      //   tasksList.add(
      //     TaskModel(
      //         id: '1',
      //         date: DateFormat.yMd().format(currentDate),
      //         color:  currentIndex ,
      //         title: titleController.text,
      //         note: noteController.text,
      //         startTime: startTime,
      //         endTime: endTime,
      //         isCompleted: false),
      //   );
      titleController.clear();
      noteController.clear();
      
      emit(InsertTaskSuccessState());
    } catch (e) {
      emit(InsertTaskErrorState());
    }
  }

//! get task
  void getTasks() async {
    emit(GetTaskLoadingState());
    await serviceLocatir<SqfliteHelper>().getFromDB().then((value) {
      tasksList = value
          .map((e) => TaskModel.fromJson(e))
          .toList()
          .where(
              (element) => element.date == DateFormat.yMd().format(selectedDate))
          .toList();
          print(value);
      emit(GetTaskSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetTaskErrorState());
    });
  }

//! update
  void updateTask(id) async {
    emit(UpdateTaskLoadingState());
    await serviceLocatir<SqfliteHelper>().updateDB(id).then((value) {
      emit(UpdateTaskSuccessState());
      getTasks();
    }).catchError((e) {
      print(e.toString());
      emit(UpdateTaskErrorState());
    });
  }

  void deleteTask(id) async {
    emit(DeleteTaskLoadingState());
    await serviceLocatir<SqfliteHelper>().deleteFromDB(id).then((value) {
      emit(DeleteTaskSuccessState());
      getTasks();
    }).catchError((e) {
      print(e.toString());
      emit(DeleteTaskErrorState());
    });
  }
}
