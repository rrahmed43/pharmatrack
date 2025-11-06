import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final String imagePath;
  final Color backgroundColor;

  const ShopCard({
    super.key,
    required this.imagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: InkWell(child: Image.asset(imagePath, fit: BoxFit.cover,))),
          ],
        ),
      ),
    );
  }
}
