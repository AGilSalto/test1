import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

class FastForm2 extends StatefulWidget {
  const FastForm2({Key? key}) : super(key: key);

  @override
  State<FastForm2> createState() {
    return _FastFormState2();
  }
}

class _FastFormState2 extends State<FastForm2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FastFormSection(children: <Widget>[
      FastChoiceChips(
        name: 'choice_chips',
        labelText: 'Choice Chips',
        alignment: WrapAlignment.center,
        chipPadding: const EdgeInsets.all(8.0),
        chips: [
          FastChoiceChip(
            avatar: const FlutterLogo(),
            selected: true,
            value: 'Flutter',
          ),
          FastChoiceChip(
            avatar: const Icon(Icons.android_sharp, size: 16.0),
            value: 'Android',
          ),
          FastChoiceChip(
            selected: true,
            value: 'Chrome OS',
          ),
        ],
        validator: (value) => value == null || value.isEmpty
            ? 'Please select at least one chip'
            : null,
      ),
      const Divider(color: Colors.transparent),
      const FastSwitch(
        name: 'switch',
        labelText: 'Switch',
        titleText: 'This is a switch',
        contentPadding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
      ),
      const Divider(color: Colors.transparent),
      FastTextField(
        name: 'text_field',
        labelText: 'Text Field',
        placeholder: 'MM/JJJJ',
        keyboardType: TextInputType.datetime,
        maxLength: 7,
        prefix: const Icon(Icons.calendar_today),
        buildCounter: inputCounterWidgetBuilder,
        inputFormatters: const [],
        validator: Validators.compose([
          Validators.required((value) => 'Field is required'),
          Validators.minLength(
              7,
              (value, minLength) =>
                  'Field must contain at least $minLength characters')
        ]),
      ),
      const Divider(color: Colors.transparent),
      const FastDropdown<String>(
        name: 'dropdown',
        labelText: 'Dropdown Field',
        items: ['Norway', 'Sweden', 'Finland', 'Denmark', 'Iceland'],
        initialValue: 'Finland',
      ),
      const Divider(color: Colors.transparent),
      FastRadioGroup<String>(
        name: 'radio_group',
        labelText: 'Radio Group Model',
        options: const [
          FastRadioOption(text: 'Option 1', value: 'option-1'),
          FastRadioOption(text: 'Option 2', value: 'option-2'),
          FastRadioOption(text: 'Option 3', value: 'option-3'),
        ],
      ),
    ]));
  }
}
