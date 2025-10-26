import 'package:flutter/material.dart';
import 'package:task/home/presentation/view/widgets/add_medicine_dialog.dart';

class PortalCards extends StatelessWidget {
  Color color;
  // String title;
  String message;
  String subMessage;
  PortalCards({
    super.key,
    required this.color,
    // required this.title,
    required this.message,
    required this.subMessage,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        // Text(
        //   title,
        //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        // ),
        Card(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: SizedBox(
            height: screenHeight * 0.15,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    message,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subMessage,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 2),
                  InkWell(
                    child: Icon(Icons.add),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddMedicineDialog();
                        },
                      );
                      
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
