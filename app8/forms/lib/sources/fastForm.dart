import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

class FastForm extends StatefulWidget {
  const FastForm({Key? key}) : super(key: key);

  @override
  State<FastForm> createState() {
    return _FastFormState();
  }
}

class _FastFormState extends State<FastForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FastFormSection(
            padding: const EdgeInsets.all(16.0),
            header: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Form Example Section',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            children: [
          FastAutocomplete<String>(
            name: 'autocomplete',
            labelText: 'Autocomplete',
            options: const ['Alaska', 'Alabama', 'Connecticut', 'Delaware'],
          ),
          const Divider(color: Colors.transparent),
          FastDatePicker(
            name: 'date_picker',
            labelText: 'Date Picker',
            firstDate: DateTime(1970),
            lastDate: DateTime(2040),
          ),
          const Divider(color: Colors.transparent),
          FastDateRangePicker(
            name: 'date_range_picker',
            labelText: 'Date Range Picker',
            firstDate: DateTime(1970),
            lastDate: DateTime(2040),
          ),
          const Divider(color: Colors.transparent),
          const FastChipsInput(
            name: 'input_chips',
            labelText: 'Input Chips',
            options: ['Angular', 'React', 'Vue', 'Svelte', 'Flutter'],
            initialValue: [
              'HTML',
              'CSS',
              'React',
              'Dart',
              'TypeScript',
              'Angular',
            ],
          ),
        ]));
  }
}
