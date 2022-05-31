import 'package:json_annotation/json_annotation.dart';

part 'point.g.dart';

@JsonSerializable()
class Point {
  Point({
    required this.id,
    required this.lat,
    required this.lng,
    required this.accessible,
    required this.name,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      id: json["id"].toString(),
      lat: json["lat"],
      lng: json["lng"],
      accessible: json["accessible"] == "TRUE",
      name: json["name"],
    );
  }
  Map<String, dynamic> toJson() => _$PointToJson(this);

  final String id;
  final double lat;
  final double lng;
  final String name;
  final bool accessible;
}
