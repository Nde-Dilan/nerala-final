import 'package:flutter/material.dart';
import 'package:flutter_flashcards/notifiers/flashcards_notifier.dart';
import 'package:flutter_flashcards/notifiers/review_notifier.dart';
import 'package:flutter_flashcards/notifiers/settings_notifier.dart';
import 'package:flutter_flashcards/notifiers/user_notifier.dart';
import 'package:flutter_flashcards/pages/home_page.dart';
import 'package:flutter_flashcards/pages/start_page.dart';
import 'package:flutter_flashcards/pages/dashboard_page.dart';
import 'package:flutter_flashcards/utils/methods.dart';
import 'package:provider/provider.dart';

import 'configs/themes.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FlashcardsNotifier()),
    ChangeNotifierProvider(create: (_) => SettingsNotifier()),
    ChangeNotifierProvider(create: (_) => ReviewNotifier()),
    ChangeNotifierProvider(create: (_) => UserNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    updatePreferencesOnRestart(context: context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cameroon Flashcards',
      theme: appTheme,
      home: PageView(
        children: const [
          Dashboard(),
          WelcomePage(),
          //
          HomePage(),
        ],
      ),
    );
  }
}
