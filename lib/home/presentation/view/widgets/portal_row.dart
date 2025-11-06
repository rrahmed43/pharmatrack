import 'package:flutter/material.dart';
import 'package:task/home/presentation/view/widgets/add_medicine_dialog.dart';
import 'package:task/home/presentation/view/widgets/add_restock_dialog.dart';
import 'package:task/home/presentation/view/widgets/dynamic_form_widget.dart';
import 'package:task/home/presentation/view/widgets/medicine_card.dart';
import 'package:task/home/presentation/view/widgets/portal_card.dart';

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
          "Portal",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SavedMedicineDetailsPage()
            ),
            Expanded(
              child: PortalCard(
                isEmpty: true,
                color: Colors.green,
                inkWellWidget: DynamicFormWidget(),
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
