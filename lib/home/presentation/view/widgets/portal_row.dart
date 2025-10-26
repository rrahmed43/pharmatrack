import 'package:flutter/material.dart';
import 'package:task/home/presentation/view/widgets/portal_cards.dart';

class PortalRow extends StatefulWidget {
  const PortalRow({super.key});

  @override
  State<PortalRow> createState() => _PortalRowState();
}

class _PortalRowState extends State<PortalRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
            "Your portal",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PortalCards(
                color: Colors.pink,
                // title: "Your medicines",
                message: "Medicine list",
                subMessage: "Add your Medicine list now",
              ),
            ),
            Expanded(
              child: PortalCards(
                color: Colors.green,
                // title: "Restock",
                message: "Restock List",
                subMessage: "Add your restock list now",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
