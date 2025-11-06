import 'package:flutter/material.dart';

class DatePickerDynamic extends StatefulWidget {
  final Function(String type, DateTime? date)? onChanged;
  const DatePickerDynamic({super.key, this.onChanged});

  @override
  State<DatePickerDynamic> createState() => _DatePickerDynamicState();
}

class _DatePickerDynamicState extends State<DatePickerDynamic> {
  final items = ['start', 'end'];
  String dropdownValue = 'start';
  DateTime? selectedDate;

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
      widget.onChanged?.call(dropdownValue, selectedDate);//notify the parent that will use this class with the changes (widget. ...)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: dropdownValue,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (newValue) {
            if (newValue != null) {
              setState(() => dropdownValue = newValue);
              widget.onChanged?.call(dropdownValue, selectedDate);
            }
          },
        ),
        ElevatedButton(onPressed: pickDate, child: const Text("Pick a date")),
      ],
    );
  }
}
