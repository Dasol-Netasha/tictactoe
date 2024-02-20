import 'package:flutter/material.dart';

class DropdownMenu extends StatelessWidget {
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String?> onChanged;
  final List<DropdownMenuItem<String>> dropdownMenuEntries;

  const DropdownMenu({
    required this.options,
    required this.selectedOption,
    required this.onChanged,
    required this.dropdownMenuEntries,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedOption,
      onChanged: onChanged,
      items: dropdownMenuEntries,
    );
  }
}