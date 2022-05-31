import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:routes_ufpb/data/entities/route_line.dart';

class GetAllRoutes {
  Future<List<RouteLine>> call() async {
    final List<RouteLine> routes = [];
    final result = json.decode(
      await rootBundle.loadString('assets/locations.json'),
    );

    for (final Map<String, dynamic> pointData in result) {
      routes.add(RouteLine.fromJson(pointData));
    }

    return routes;
  }
}
