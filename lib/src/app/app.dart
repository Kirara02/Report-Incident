import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:report_incident/src/features/home/view/home_page.dart';

import '../config/constant.dart';
import '../config/theme/colors.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // log(context.locale.toString());
      // context.setLocale(Locale('id'));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pelaporan Kejadian',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: UIColors.text,
            fontWeight: FontWeight.w500,
            fontSize: AppConstants.kFontSizeL,
          ),
          centerTitle: false,
          backgroundColor: AppColors.primary,
          actionsIconTheme: IconThemeData(
            color: UIColors.text,
          ),
          iconTheme: IconThemeData(
            color: UIColors.text,
          ),
        ),
        scaffoldBackgroundColor: AppColors.primary,
      ),
      home: const HomePage(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
