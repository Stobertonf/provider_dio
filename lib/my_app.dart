import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_dio/pages/Home/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider_dio/service/dark_mode_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkModeService>(
            create: (_) => DarkModeService()),
      ],
      child: Consumer<DarkModeService>(builder: (_, darkModeService, widget) {
        return MaterialApp(
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          theme:
              darkModeService.darkMode ? ThemeData.dark() : ThemeData.light(),
          home: const HomePage(),
        );
      }),
    );
  }
}
