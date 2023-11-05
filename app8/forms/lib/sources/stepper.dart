import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class StepperForm extends StatefulWidget {
  const StepperForm({Key? key}) : super(key: key);

  @override
  State<StepperForm> createState() {
    return _StepperFormState();
  }
}

class _StepperFormState extends State<StepperForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FormBuilder(
            key: _formKey,
            onChanged: () {},
            autovalidateMode: AutovalidateMode.disabled,
            skipDisabled: true,
            child: Column(
              children: [
                Stepper(steps: <Step>[
                  Step(
                    title: const Text("title"),
                    content: Column(children: const [
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            prefixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: Icon(
                                Icons.mail,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 15),
                        child: TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Address',
                            prefixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: Icon(
                                Icons.house,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Mobile No',
                            prefixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: Icon(
                                Icons.phone,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  const Step(title: Text("title"), content: Text("title")),
                  const Step(title: Text("title"), content: Text("title"))
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
