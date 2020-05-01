import 'package:ACApp/repositories/flower.dart';
import 'package:ACApp/repositories/villager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'providers/index.dart';
import 'repositories/index.dart';
import 'ui/screens/index.dart';

void main() => runApp(CherryApp());

/// Builds the neccesary providers, as well as the home page.
class CherryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => VillagerRepository()),
        ChangeNotifierProvider(create: (_) => CritterRepository()),
        ChangeNotifierProvider(create: (_) => TodayRepository()),
        ChangeNotifierProvider(create: (_) => FossilRepository()),
        ChangeNotifierProvider(create: (_) => FlowerRepository()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, model, child) => MaterialApp(
          title: 'AC App',
          theme: model.requestTheme(Themes.light),
          darkTheme: model.requestTheme(Themes.dark),
          home: StartScreen(),
          localizationsDelegates: [
            FlutterI18nDelegate(
              translationLoader: FileTranslationLoader(fallbackFile: 'en'),
            ),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
        ),
      ),
    );
  }
}