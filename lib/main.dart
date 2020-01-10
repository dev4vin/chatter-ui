import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'screen/home_screen.dart';
import 'app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            builder: (_) => ThemeProvider(isLightTheme: true),
            child: MyApp(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatr',
      theme: themeProvider.getThemeData,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
      ],
      localizationsDelegates: [
        AppLocaLizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (lc, supportedLocals) {
        for (var supportedLocale in supportedLocals) {
          if (supportedLocale.languageCode == lc.languageCode &&
              supportedLocale.countryCode == lc.countryCode) {
            return supportedLocale;
          }
        }

        return supportedLocals.first;
      },
      home: HomeScreen(),
    );
  }
}
