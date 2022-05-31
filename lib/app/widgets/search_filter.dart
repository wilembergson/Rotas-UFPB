import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:routes_ufpb/app/widgets/point_tile.dart';
import 'package:routes_ufpb/data/entities/point.dart';

class SearchFilter extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String) onChanged;
  final List<Point> points;
  final Function(Point) onSelected;
  final String hint;

  const SearchFilter(
      {Key? key,
      required this.controller,
      required this.onChanged,
      required this.points,
      required this.onSelected,
      required this.hint})
      : super(key: key);

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  late double flexible;
  late bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    getFlexibleZize();
    return Container(
      height: flexible,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                hintText: widget.hint,
              ),
              onChanged: (value) {
                widget.onChanged(value);
                getFlexibleZize();
              },
            ),
          ),
          Expanded(
              child: ListView.separated(
            itemCount: widget.points.length,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: (context, index) {
              return PointTile(
                point: widget.points[index],
                onSelected: (point) {
                  widget.onSelected(point);
                  setState(() {
                    isSelected = true;
                  });
                },
              );
            },
          ))
        ],
      ),
    );
  }

  getFlexibleZize() {
    final size = MediaQuery.of(context).size.height;
    if (kIsWeb) {
      if (widget.controller!.text.isNotEmpty && !isSelected) {
        setState(() {
          flexible = size * 0.3;
        });
      } else {
        setState(() {
          flexible = size * 0.1;
        });
      }
    } else {
      if (widget.controller != null &&
          widget.controller!.text.isNotEmpty &&
          !isSelected) {
        setState(() {
          flexible = size * 0.15;
        });
      } else {
        setState(() {
          flexible = size * 0.07;
        });
      }
    }
  }
}
