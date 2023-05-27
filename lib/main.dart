import 'my_app.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'models/lista_tarefa_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider_dio/repository/posts_repository.dart';
import 'package:provider_dio/service/counter_mobx_service.dart';
import 'package:provider_dio/repository/comments_repository.dart';
import 'package:provider_dio/repository/impl/posts_dio_repository.dart';
import 'package:provider_dio/repository/jsonplaceholder_custon_dio.dart';
import 'package:provider_dio/repository/impl/comments_dio_repository.dart';

final getIt = GetIt.instance;

setupGetIt() {
  getIt.registerSingleton<CounterMobXService>(CounterMobXService());
  getIt.registerSingleton<JsonPlaceHolderCustonDio>(JsonPlaceHolderCustonDio());
  getIt.registerSingleton<PostsRepository>(
      PostsDioRepository(getIt<JsonPlaceHolderCustonDio>()));
  getIt.registerSingleton<CommentsRepository>(
      CommentsDioRepsositoy(getIt<JsonPlaceHolderCustonDio>()));
  getIt.registerSingleton<ListaTarefasStore>(ListaTarefasStore());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setupGetIt();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale(
        'pt',
        'BR',
      ),
      child: const MyApp(),
    ),
  );
}
