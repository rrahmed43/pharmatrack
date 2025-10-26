import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color backgroundColor;

  const PromoCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // card width
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
            // const SizedBox(height: 8),
            // Text(
            //   title,
            //   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }
}
