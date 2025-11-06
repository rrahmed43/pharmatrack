import 'package:flutter/material.dart';
import 'package:task/home/presentation/view/widgets/shop_card.dart';

class ShopRow extends StatelessWidget {
  const ShopRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shop",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 4),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              ShopCard(
                imagePath: 'assets/freedelivery.png',
                backgroundColor: Color(0xFFEBD7FF),
              ),
              ShopCard(
                imagePath: 'assets/expressdelivery.png',
                backgroundColor: Color(0xFFD7C1FF),
              ),
              ShopCard(
                imagePath: 'assets/service.png',
                backgroundColor: Color(0xFFF4D9FF),
              ),
              ShopCard(
                imagePath: 'assets/topdeals.png',
                backgroundColor: Color(0xFFE3D1FF),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
