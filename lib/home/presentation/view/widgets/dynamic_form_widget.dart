import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/home/presentation/view_model/home_bloc.dart';
import 'package:task/home/presentation/view_model/home_event.dart';
import 'package:task/home/presentation/view_model/home_state.dart';
import 'date_picker_dynamic.dart';
import 'text_form_dynamic.dart';

class DynamicFormWidget extends StatefulWidget {
  const DynamicFormWidget({super.key});

  @override
  State<DynamicFormWidget> createState() => _DynamicFormWidgetState();
}

class _DynamicFormWidgetState extends State<DynamicFormWidget> {
  final List<_FormItem> formItems = [];
  final List<String> choice = ['name', 'dose', 'date', 'note'];
  String choiceValue = 'name';
  Map<String, dynamic> savedData = {};

  void addItem() {
    setState(() {
      formItems.add(_FormItem(type: choiceValue));
    });
  }

  void submit() {
    Map<String, dynamic> collectedData = {};
    for (var item in formItems) {
      if (item.type == 'date') {
        collectedData[item.dateType!] = item.dateValue?.toIso8601String();
      } else {
        collectedData[item.type] = item.value;
      }
    }
    context.read<HomeBloc>().add(SaveDynamicData(collectedData));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.dynamicDataState == HomeStatus.success) {
          Navigator.of(context).pop(); // ✅ Close dialog on success
        } else if (state.dynamicDataState == HomeStatus.error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Failed to save data")));
        }
      },
      child: AlertDialog(
        title: Row(
          children: [
            const Text("Medicine Form"),
            IconButton(icon: const Icon(Icons.add), onPressed: addItem),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...formItems.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: item.type == 'date'
                            ? DatePickerDynamic(
                                onChanged: (type, date) {
                                  item.dateType = type;
                                  item.dateValue = date;
                                },
                              )
                            : TextFormDynamic(
                                controller: item.controller,
                                label: item.type,
                                onChanged: (text) => item.value = text,
                              ),
                      ),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: item.type,
                        items: choice
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                        onChanged: (newType) {
                          if (newType != null) {
                            setState(() {
                              item.type = newType;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: submit,
                child: const Text("Submit and Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormItem {
  String type;
  TextEditingController controller;
  String? value;
  String? dateType;
  DateTime? dateValue;

  _FormItem({required this.type})
    : controller = TextEditingController(),
      value = '';

  Map<String, dynamic> toMap() => {
    'type': type,
    'value': value,
    'dateType': dateType,
    'dateValue': dateValue?.toIso8601String(),
  };
}
