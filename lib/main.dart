import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_project/my_theme.dart';
import 'package:to_do_project/providers/my_provider.dart';
import 'package:to_do_project/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.languageCode),
      themeMode: provider.myTheme,
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.DarkTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
      },
    );
  }
}
