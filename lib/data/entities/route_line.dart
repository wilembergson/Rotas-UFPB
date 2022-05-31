import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_line.g.dart';

@JsonSerializable()
class RouteLine {
  RouteLine({
    required this.id,
    required this.idStart,
    required this.idEnd,
    required this.accessible,
    required this.name,
    required this.points,
  });

  factory RouteLine.fromJson(Map<String, dynamic> json) {
    return RouteLine(
      id: json["ID"].toString(),
      idStart: json["IDSTART"].toString(),
      idEnd: json["IDEND"].toString(),
      accessible: json["ACCESSIBLE"] == "TRUE",
      name: json["NAME"],
      points: json["POINTS"],
    );
  }
  Map<String, dynamic> toJson() => _$RouteLineToJson(this);

  List<LatLng> getCord() {
    List<LatLng> cords = [];

    for (final String data in points) {
      final value = data.split(",");
      final lat = double.parse(value[0]);
      final lon = double.parse(value[1]);

      cords.add(LatLng(lat, lon));
    }

    return cords;
  }

  final String id;
  final String idStart;
  final String idEnd;
  final String name;
  final bool accessible;
  final List<dynamic> points;
}
