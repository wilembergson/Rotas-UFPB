import 'package:flutter/material.dart';
import 'package:routes_ufpb/data/entities/point.dart';

class PointTile extends StatelessWidget {
  final Point point;
  final Function(Point) onSelected;

  const PointTile({
    Key? key,
    required this.point,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        point.name,
      ),
      leading: const Icon(
        Icons.school,
        color: Colors.black,
      ),
      subtitle: Row(
        children: [
          Icon(
            point.accessible ? Icons.accessible : Icons.not_accessible,
            color: point.accessible ? Colors.blue : Colors.red,
          ),
          Text(
            point.accessible ? "Predio Acessivel" : "Predio não acessivel",
          )
        ],
      ),
      onTap: () {
        onSelected(point);
      },
    );
  }
}
