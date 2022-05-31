import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TargetCustom {
  TargetFocus call(String id, GlobalKey key, String title, String content,
      ContentAlign align, ShapeLightFocus shape) {
    return TargetFocus(
        identify: id,
        keyTarget: key,
        alignSkip: Alignment.bottomRight,
        contents: [
          TargetContent(
              align: align,
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        content,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )),
        ],
        shape: shape);
  }
}
