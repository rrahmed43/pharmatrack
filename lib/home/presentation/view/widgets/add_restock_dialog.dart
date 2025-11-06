import 'package:flutter/material.dart';

class AddRestockDialog extends StatelessWidget {
  const AddRestockDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> pickDate() async {
      // final DateTime? date =
      await showDatePicker(
        context: context,
        initialDate: DateTime.now(), 
        firstDate: DateTime(2000), 
        lastDate: DateTime(2100), 
      );
    }

    return AlertDialog(
      title: Text("Add medicine "),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Medicine Name',
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Dosage (Times per day)',
                      isDense: true,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: pickDate,
                    child: Text("Restock date"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
