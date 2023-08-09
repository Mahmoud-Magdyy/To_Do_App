import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_eleveted_button.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_state.dart';

import '../../components/add_task_components.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              child: BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! title
                      AddTaskComponent(
                          title: AppStrings.title,
                          hintText: AppStrings.titleHint,
                          controller: titleController),
                      SizedBox(
                        height: 24.h,
                      ),
                      //! note
                      AddTaskComponent(
                          title: AppStrings.note,
                          hintText: AppStrings.noteHint,
                          controller: noteController),
                      SizedBox(
                        height: 24.h,
                      ),
                      //! date
                      AddTaskComponent(
                        readOnly: true,
                        title: AppStrings.date,
                        hintText: DateFormat.yMd().format(
                            BlocProvider.of<TaskCubit>(context).currentDate),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            BlocProvider.of<TaskCubit>(context)
                                .GetDate(context);
                          },
                          icon: const Icon(
                            Icons.calendar_month,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      //! date
                      Row(
                        children: [
                          //! date start
                          Expanded(
                            child: AddTaskComponent(
                              title: AppStrings.startTime,
                              hintText:
                                  BlocProvider.of<TaskCubit>(context).startTime,
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    BlocProvider.of<TaskCubit>(context)
                                        .getStartDate(context);
                                  },
                                  icon: const Icon(
                                    Icons.timer_outlined,
                                    color: AppColors.white,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 26.h,
                          ),
                          //! date end
                          Expanded(
                            child: AddTaskComponent(
                              title: AppStrings.endTime,
                              hintText:
                                  BlocProvider.of<TaskCubit>(context).endTime,
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    BlocProvider.of<TaskCubit>(context)
                                        .getEndDate(context);
                                  },
                                  icon: const Icon(
                                    Icons.timer_outlined,
                                    color: AppColors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      //! colors
                      SizedBox(
                        height: 68.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.color,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Expanded(
                                child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        BlocProvider.of<TaskCubit>(context)
                                            .changeCheckMarkIndex(index);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor:
                                            BlocProvider.of<TaskCubit>(context)
                                                .getColor(index),
                                        child: index ==
                                                BlocProvider.of<TaskCubit>(
                                                        context)
                                                    .currentIndex
                                            ? const Icon(Icons.check)
                                            : null,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    )
                                  ],
                                );
                              },
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 90.h,
                      ),
                      //! add task button
                      //  Spacer(),
                      SizedBox(
                        height: 48.h,
                        width: double.infinity,
                        child: CustomElevetedButton(
                            text: AppStrings.createTask, onPressed: () {}),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
