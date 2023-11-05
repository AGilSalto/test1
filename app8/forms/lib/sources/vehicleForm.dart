import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class VehicleForm extends StatefulWidget {
  const VehicleForm({Key? key}) : super(key: key);

  @override
  State<VehicleForm> createState() {
    return _VehicleFormState();
  }
}

class _VehicleFormState extends State<VehicleForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();

  var speedOptions = ['SpeedOption1', 'SpeedOption2', 'SpeedOption3'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FormBuilder(
            key: _formKey,
            // enabled: false,
            onChanged: () {},
            autovalidateMode: AutovalidateMode.disabled,
            skipDisabled: true,
            child: Column(
              children: <Widget>[
                const Text(
                  "Title",
                  textScaleFactor: 2.5,
                ),
                const Text("Subtitle"),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Question1",
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "Question1 subtext",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    const Spacer()
                  ],
                ),
                FormBuilderRadioGroup<String>(
                  orientation: OptionsOrientation.vertical,
                  initialValue: null,
                  name: 'Options',
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  options: ['Option1', 'Option2', 'Option3']
                      .map((lang) => FormBuilderFieldOption(
                            value: lang,
                            child: Text(lang),
                          ))
                      .toList(growable: false),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.grey,
                    hintText: 'Enter your remarks',
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsetsDirectional.only(top: 15),
                          child: Text(
                            "Question2",
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Text(
                          "Question2 subtext",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    const Spacer()
                  ],
                ),
                FormBuilderDropdown<String>(
                  name: 'speed',
                  decoration: const InputDecoration(
                    hintText: 'Select speed',
                  ),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  items: speedOptions
                      .map((speed) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: speed,
                            child: Text(speed),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {});
                  },
                  valueTransformer: (val) => val?.toString(),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsetsDirectional.only(top: 15),
                          child: Text(
                            "Question3",
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Text(
                          "Question3 subtext",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    const Spacer()
                  ],
                ),
                FormBuilderCheckboxGroup<String>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  name: 'speedSelector',
                  orientation: OptionsOrientation.vertical,
                  options: const [
                    FormBuilderFieldOption(value: 'Option1'),
                    FormBuilderFieldOption(value: 'Option2'),
                    FormBuilderFieldOption(value: 'Option3'),
                    FormBuilderFieldOption(value: 'Option4'),
                  ],
                ),
                /* 
                //TODO ChoiceChips
                Wrap(
                  spacing: 100.0,
                  children: List<Widget>.generate(
                    3,
                    (int index) {
                      return ChoiceChip(
                        label: Text('Item $index'),
                        selected: false,
                        onSelected: (bool selected) {
                          setState(() {
                            //_value = selected ? index : null;
                          });
                        },
                      );
                    },
                  ).toList(),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
