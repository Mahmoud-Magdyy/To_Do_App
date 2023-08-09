import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/database/cache/cache_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_cubit.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await serviceLocatir<CacheHelper>().init();
  runApp( BlocProvider(
    create: (context) => TaskCubit(),
    child: const MyApp(),
  ));
}
