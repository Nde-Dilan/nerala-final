import 'dart:ui';

import 'package:flutter_flashcards/animations/fade_in_animation.dart';
import 'package:flutter_flashcards/components/welcome_page/language_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flashcards/configs/palette.dart';
import 'package:flutter_flashcards/pages/home_page.dart';
import 'package:flutter_flashcards/utils/tour_target.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final skipKey = GlobalKey();
  final langKey = GlobalKey();
  final registerKey = GlobalKey();

  late TutorialCoachMark _tutorialCoachMark;
  void _initialPageTour() {
    _tutorialCoachMark = TutorialCoachMark(
        targets: addTourTargets(
            skipKey: skipKey, langKey: langKey, registerKey: registerKey),
        // colorShadow: Colors.teal,
        colorShadow: Colors.red,
        textSkip: "Skip →",
        imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        paddingFocus: 10,
        hideSkip: false,
        opacityShadow: 0.8,
        onFinish: () {
          print("finish");
        },
        onClickTargetWithTapPosition: (target, tapDetails) {
          print("target: $target");
          print(
              "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
        },
        onClickTarget: (target) {
          print(target);
        },
        onSkip: () {
          print("skip");
          return true;
        });
  }

  void _showTour() => Future.delayed(const Duration(seconds: 1),
      () => _tutorialCoachMark.show(context: context));

  @override
  void initState() {
    super.initState();
    _initialPageTour();
    _showTour();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  List<String> availableLanguages = ['Ghomala', 'Fuldé', 'Tupuri'];
  String selectedLanguage = 'Fuldé';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Palette().trueWhite,
        appBar: AppBar(
          title: const Text('Nerala ``'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Let\'s create an acount',
                    style: TextStyle(
                        fontSize: 24 * size.width / 400,
                        color: Palette().green),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.1),
                    child: const FadeInAnimation(
                      child: Image(
                        width: 144,
                        image: AssetImage("assets/images/Nerala.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48,
                  child: Text(
                    "Your Name:",
                    style: TextStyle(color: Palette().black),
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name!';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 48,
                    child: Text(
                      "What do you want to learn?:",
                      style: TextStyle(color: Palette().black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LanguageSelector(
                    languages: availableLanguages,
                    selectedLanguage: selectedLanguage,
                    onLanguageChange: (newLanguage) {
                      selectedLanguage = newLanguage;
                    },
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                registerButton(context, size, "Register", registerKey),
                const SizedBox(
                  height: 18,
                ),
                registerButton(context, size, "Skip →", skipKey),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        )));
  }

  TextButton registerButton(
      BuildContext context, Size size, String text, GlobalKey? key) {
    return TextButton(
      key: key,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: Palette().black,
              width: 2.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        minimumSize:
            MaterialStateProperty.all<Size?>(Size(303 * size.width / 400, 54)),
        backgroundColor: MaterialStateProperty.all<Color?>(Palette().black),
      ),
      onPressed: () async {
        if (_formKey.currentState!.validate() && text != "Skip →") {
          // Process data.
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 19 * size.width / 400,
              color: Palette().trueWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
