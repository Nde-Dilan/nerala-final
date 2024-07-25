import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

const double tourRadius = 5;

List<TargetFocus> addTourTargets({
  required GlobalKey skipKey,
  required GlobalKey langKey,
  required GlobalKey registerKey,
}) {
  List<TargetFocus> targets = [];

  targets.add(
    TargetFocus(
      identify: "Target 1",

      keyTarget: skipKey,
      alignSkip: Alignment.bottomLeft,
      shape: ShapeLightFocus.RRect,
      radius: tourRadius,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) => Container(
            alignment: Alignment.center,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Use this button if you want to skip this phase',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    ))
              ],
            ),
          ),
        )
      ],
    ),
  );

  targets.add(
    TargetFocus(
      keyTarget: langKey,
      alignSkip: Alignment.topRight,
      shape: ShapeLightFocus.RRect,
      radius: tourRadius,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) => Container(
            alignment: Alignment.center,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hey!!\n You can choose your language here',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );

  targets.add(
    TargetFocus(
      keyTarget: registerKey,
      alignSkip: Alignment.topRight,
      shape: ShapeLightFocus.RRect,
      radius: tourRadius,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) => Container(
            alignment: Alignment.center,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Click here to register to the application',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );

  return targets;
}
