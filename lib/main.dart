import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app.dart';
import 'repositories/cripto_coin_r/cripto_coin_r.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CriptoCoinsRepository(dio: Dio()));
  runApp(const MyApp());
}
