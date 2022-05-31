import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:routes_ufpb/data/entities/point.dart';

class GetAllPoints {
  Future<List<Point>> call() async {
    final List<Point> points = [];
    final result = json.decode(
      await rootBundle.loadString('assets/points.json'),
    );

    for (final Map<String, dynamic> pointData in result) {
      points.add(Point.fromJson(pointData));
    }

    return points;
  }
}
