import 'package:flutter/material.dart';
import 'package:routes_ufpb/app/widgets/image_circle.dart';

class ProfileInfo extends StatelessWidget {
  final String image;
  final String title;
  final Color color;

  const ProfileInfo({
    Key? key,
    required this.image,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageCircle(
          isNetwork: true,
          image: image,
          border: color,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
