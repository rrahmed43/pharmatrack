import 'package:flutter/material.dart';

class AddMedicineDialog extends StatelessWidget {
  const AddMedicineDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return
    // Use an AlertDialog to create the small form message
    AlertDialog(
      title: Text(
        "Add your medicine list",
      ), // Use the card's message as the form title
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 2. Form for data entry
            Form(
              child: Column(
                children: [
                  // Field 1: Medicine Name
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Medicine Name',
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Field 2: Dosage / Quantity
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Dosage (e.g., 500mg) / Quantity',
                      isDense: true,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10),
                  // Field 3: Schedule / Refill Date
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Schedule / Refill Date',
                      isDense: true,
                    ),
                    // Consider using a Date Picker for the date field
                  ),
                  const SizedBox(height: 10),
                  // Field 4: Notes / Supplier
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Notes / Supplier',
                      isDense: true,
                    ),
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
            // TODO: Add form submission logic here
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
