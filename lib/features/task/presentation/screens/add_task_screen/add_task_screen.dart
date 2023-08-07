import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

import '../../components/add_task_components.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  DateTime currentDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text(
            AppStrings.addTask,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! title
                AddTaskComponent(
                    title: AppStrings.title,
                    hintText: AppStrings.titleHint,
                    controller: titleController),
                const SizedBox(
                  height: 24,
                ),
                //! note
                AddTaskComponent(
                    title: AppStrings.note,
                    hintText: AppStrings.noteHint,
                    controller: noteController),
                const SizedBox(
                  height: 24,
                ),
                //! date
                AddTaskComponent(
                  readOnly: true,
                  title: AppStrings.date,
                  hintText: DateFormat.yMd().format(currentDate),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      setState(() {
                        if (pickedDate != null) {
                          currentDate = pickedDate;
                        } else {
                          print('pickedDate==null');
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.calendar_month,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                //! date
                Row(
                  children: [
                    //! date start
                    Expanded(
                      child: AddTaskComponent(
                        title: AppStrings.startTime,
                        hintText: startTime,
                        suffixIcon: IconButton(
                            onPressed: () async {
                              TimeOfDay? pickedStartTime = await showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(DateTime.now()),
                              );
                              setState(() {
                                if (pickedStartTime != null) {
                                  startTime = pickedStartTime.format(context);
                                } else {
                                  print('pickedStartTime==null');
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.timer_outlined,
                              color: AppColors.white,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    //! date end
                    Expanded(
                      child: AddTaskComponent(
                        title: AppStrings.endTime,
                        hintText: endTime,
                        suffixIcon: IconButton(
                            onPressed: () async {
                              TimeOfDay? pickedEndTime = await showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(DateTime.now()),
                              );
                              setState(() {
                                if (pickedEndTime != null) {
                                  endTime = pickedEndTime.format(context);
                                } else {
                                  print('pickedEndTime==null');
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.timer_outlined,
                              color: AppColors.white,
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 26,
                ),
                //! colors
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.color,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.red,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
