import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;

  final int page;
  final Function() onTap;

  const DrawerTile(
      {Key? key,
      required this.icon,
      required this.text,
      required this.page,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 60.0,
          child: Row(
            children: <Widget>[
              const SizedBox(width: 5.0),
              Icon(
                icon,
                size: 40.0,
                color: Colors.black,
              ),
              const SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 26.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
