import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/database/cache/cache_helper.dart';

import '../database/sqflite_helper/sqflite.dart';

final serviceLocatir=GetIt.instance;

Future<void> setup() async{
   serviceLocatir.registerLazySingleton<CacheHelper>(()=>CacheHelper());
   serviceLocatir.registerLazySingleton<SqfliteHelper>(()=>SqfliteHelper());
}