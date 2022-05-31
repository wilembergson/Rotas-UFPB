import 'package:flutter/material.dart';

class ImageCircle extends StatelessWidget {
  final String image;
  final bool isNetwork;
  final Color border;

  const ImageCircle({
    Key? key,
    required this.image,
    this.isNetwork = false,
    this.border = Colors.amber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: border,
          width: 5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            80.0,
          ),
        ),
        image: DecorationImage(
          image: isNetwork
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
