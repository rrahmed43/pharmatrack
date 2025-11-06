import 'package:flutter/material.dart';


class PortalCard extends StatelessWidget {
  final Color color;
  final Widget? inkWellWidget;
  final bool isEmpty ;
  final String? message;
  final String? subMessage;
  final Widget? cardChild;
  const PortalCard({
    super.key,
    required this.isEmpty,
     this.inkWellWidget,
    required this.color,
    this.message,
    this.subMessage,
    this.cardChild,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Card(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: SizedBox(
            height: screenHeight * 0.15,
            child: Center(
              child: isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          message!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          subMessage!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 2),
                        InkWell(
                          child: Icon(Icons.add),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                // return AddMedicineDialog();
                                return inkWellWidget!;
                              },
                            );
                          },
                        ),
                      ],
                    )
                  : cardChild,
            ),
          ),
        ),
      ],
    );
  }
}
