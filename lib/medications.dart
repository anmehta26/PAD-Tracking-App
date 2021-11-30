import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class MedicationsStatefulWidget extends StatefulWidget {
  const MedicationsStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MedicationsStatefulWidget> createState() => _EnterMedications();
}

class _EnterMedications extends State<MedicationsStatefulWidget> {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(15, 14, 61, 25));
  static const TextStyle entryStyle = TextStyle(color: Color.fromRGBO(211, 167, 11, 1));

  bool? _checkedCholesterol = false;
  bool? _checkedThinner = false;
  bool? _checkedDiabetes = false;
  bool? _checkedPressure = false;

  List<bool?> _checks = <bool?>[];

  // void _navigatetoVisuals(BuildContext context) async {
  //   // Navigator.push returns a Future that completes after calling
  //   // Navigator.pop on the Selection Screen.
  //   final data = await Navigator.push(
  //     context,
  //     // Create the SelectionScreen in the next step.
  //     MaterialPageRoute(builder: (context) => const VisualsStatefulWidget()),
  //   );
  //
  //   box = data;
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(15, 14, 61, 25),
        iconTheme: const IconThemeData(color: Color.fromRGBO(211, 167, 11, 1)),
        title: const Text("New Entry", style: entryStyle),
      ),
      body: ListView(
        children: [
          Column(children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'My Medications',
                style: optionStyle,
              ),
            ), // My Medications
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CheckboxListTile(
                  title: const Text('Did you take your diabetes medication?'),
                  value: _checkedDiabetes,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkedDiabetes = value;
                    });
                  },
                  secondary: const Icon(Icons.medication_outlined),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CheckboxListTile(
                  title: const Text(
                      'Did you take your blood pressure medication?'),
                  value: _checkedPressure,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkedPressure = value;
                    });
                  },
                  secondary: const Icon(Icons.bloodtype),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CheckboxListTile(
                  title:
                  const Text('Did you take your cholesterol medication?'),
                  value: _checkedCholesterol,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkedCholesterol = value;
                    });
                  },
                  secondary: const Icon(Icons.medical_services),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CheckboxListTile(
                  title:
                  const Text('Did you take your blood thinner medication?'),
                  value: _checkedThinner,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkedThinner = value;
                    });
                  },
                  secondary: const Icon(Icons.healing),
                )),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(15, 14, 61, 25))),
              onPressed: () async {
                addAll();
                Navigator.pop(context, _checks);
              },
              child: const Text('Submit!'),
            )
          ]),
        ],
      ),
    );
  }

  void addAll() {
    _checks.add(_checkedCholesterol);
    _checks.add(_checkedThinner);
    _checks.add(_checkedPressure);
    _checks.add(_checkedDiabetes);
  }
}