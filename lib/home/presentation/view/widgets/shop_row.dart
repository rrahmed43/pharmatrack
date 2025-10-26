import 'package:flutter/material.dart';
import 'package:task/home/presentation/view/widgets/shop_cards.dart';

class PromoRow extends StatelessWidget {
  const PromoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // adjust as needed
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          PromoCard(
            imagePath: 'assets/freedelivery.png',
            title: 'Free Delivery',
            backgroundColor: Color(0xFFEBD7FF),
          ),
          PromoCard(
            imagePath: 'assets/expressdelivery.png',
            title: 'Express Delivery',
            backgroundColor: Color(0xFFD7C1FF),
          ),
          PromoCard(
            imagePath: 'assets/service.png',
            title: 'Open 24/7',
            backgroundColor: Color(0xFFF4D9FF),
          ),
          PromoCard(
            imagePath: 'assets/topdeals.png',
            title: 'Top Deals',
            backgroundColor: Color(0xFFE3D1FF),
          ),
        ],
      ),
    );
  }
}
