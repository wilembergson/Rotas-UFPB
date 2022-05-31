import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class Util {
  void showTutorial(List<TargetFocus> targets, BuildContext context) {
    TutorialCoachMark(
      context,
      targets: targets,
      colorShadow: Theme.of(context).primaryColor,
      textSkip: "PULAR",
      paddingFocus: 20,
      opacityShadow: 0.8,
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
      },
    ).show();
  }

  afterLayoutTutorial(BuildContext context, targets) {
    Future.delayed(Duration.zero, () {
      showTutorial(
        targets,
        context,
      );
    });
  }
}
