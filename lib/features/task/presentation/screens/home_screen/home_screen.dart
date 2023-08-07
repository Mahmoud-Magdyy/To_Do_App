import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_eleveted_button.dart';
import 'package:to_do_app/features/task/presentation/screens/add_task_screen/add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //date now
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 12),
              //today
              Text(
                AppStrings.toDay,
                style: Theme.of(context).textTheme.displayLarge,
              ),

              //date picker
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primary,
                selectedTextColor: Colors.white,
                dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),
              const SizedBox(
                height: 50,
              ),
              //no tasks
              // const NoTasksWidget()
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: const EdgeInsets.all(24),
                            height: 240,
                            width: 375,
                            color: AppColors.deepGrey,
                            child: Column(
                              children: [
                                //taskCompleted
                                SizedBox(
                                  height: 48,
                                  width: double.infinity,
                                  child: CustomElevetedButton(
                                      text: AppStrings.completed,
                                      onPressed: () {}),
                                ),
                                const SizedBox(height: 24,),
                                //delet task
                                SizedBox(
                                  height: 48,
                                  width: double.infinity,
                                  child: CustomElevetedButton(
                                    backgroundColor: AppColors.red,
                                      text: AppStrings.deleteTask,
                                      onPressed: () {}),
                                ),
                                const SizedBox(height: 24,),
                                //cancel task
                                SizedBox(
                                  height: 48,
                                  width: double.infinity,
                                  child: CustomElevetedButton(
                                      text: AppStrings.cancel,
                                      onPressed: () {}),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: const TaskComponents())
            ],
          ),
        ),
        //fba
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=> AddTaskScreen()));
          },
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class TaskComponents extends StatelessWidget {
  const TaskComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 132,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.red,
      ),
      child: Row(
        children: [
          //column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //text
              Text(
                'Task 1',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  //row
                  const Icon(
                    Icons.timer,
                    color: AppColors.white,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '09:33 PM - 09:48 PM',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              //text
              Text(
                'learn Dart',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          const Spacer(),
          //divider
          Container(
            height: 80,
            width: 1,
            color: AppColors.white,
          ),
          const SizedBox(
            width: 9,
          ),
          //text
          RotatedBox(
            quarterTurns: 3,
            child: Text(AppStrings.toDo,
                style: Theme.of(context).textTheme.displayMedium),
          )
        ],
      ),
    );
  }
}

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.noTasks),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppStrings.noTaskTitle,
          style:
              Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(AppStrings.noTaskSubTitle,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 24)),
      ],
    );
  }
}
