import 'my_app.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider_dio/repository/comments_repository.dart';
import 'package:provider_dio/repository/jsonplaceholder_custon_dio.dart';

final getIt = GetIt.instance;

setupGetIt() {
  getIt.registerSingleton<JsonPlaceHolderCustonDio>(JsonPlaceHolderCustonDio());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setupGetIt();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('pt', 'BR')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('pt', 'BR'),
        child: const MyApp()),
  );
}
