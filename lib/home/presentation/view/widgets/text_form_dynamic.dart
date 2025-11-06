import 'package:flutter/material.dart';

class TextFormDynamic extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Function(String text)? onChanged;

  const TextFormDynamic({
    super.key,
    required this.controller,
    required this.label,
    this.onChanged,
  });

  @override
  State<TextFormDynamic> createState() => _TextFormDynamicState();
}

class _TextFormDynamicState extends State<TextFormDynamic> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(hintText: widget.label),
    );
  }
}
