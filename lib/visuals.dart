import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'dart:math';


class VisualsStatefulWidget extends StatefulWidget {
  const VisualsStatefulWidget({Key? key}) : super(key: key);

  @override
  State<VisualsStatefulWidget> createState() => _EnterVisuals();
}

class _EnterVisuals extends State<VisualsStatefulWidget> {

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(15, 14, 61, 25));
  static const TextStyle entryStyle = TextStyle(color: Color.fromRGBO(211, 167, 11, 1));

  String swollenDropDownValue = 'None';
  String discolorDropDownValue = 'None';
  String peelingDropDownValue = 'None';
  String soresDropDownValue = 'None';

  List<String> _ratings = <String>[];

  MaterialColor _setDropdownColor(String feeling) {
    if (feeling == "None") {
      return Colors.green;
    } else if (feeling == "Mild") {
      return Colors.yellow;
    } else if (feeling == "Moderate") {
      return Colors.orange;
    } else if (feeling == "Severe"){
      return Colors.deepOrange;
    } else {
      return Colors.red;
    }
  }

  void addAll() {
    _ratings.add(swollenDropDownValue);
    _ratings.add(discolorDropDownValue);
    _ratings.add(peelingDropDownValue);
    _ratings.add(soresDropDownValue);
  }

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
                'My Visuals',
                style: optionStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [const Text('Swollen Feet'),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: DropdownButton<String>(
                        value: swollenDropDownValue,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: _setDropdownColor(swollenDropDownValue),
                        ),
                        onChanged: (String? swollenValue) {
                          setState(() {
                            swollenDropDownValue = swollenValue!;
                          });
                        },
                        items: <String>['None', 'Mild', 'Moderate', 'Severe', 'Unbearable']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [const Text('Feet Discoloration or Paleness'),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: DropdownButton<String>(
                        value: discolorDropDownValue,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: _setDropdownColor(discolorDropDownValue),
                        ),
                        onChanged: (String? discolorValue) {
                          setState(() {
                            discolorDropDownValue = discolorValue!;
                          });
                        },
                        items: <String>['None', 'Mild', 'Moderate', 'Severe', 'Unbearable']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [const Text('Peeling skin on feet'),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: DropdownButton<String>(
                        value: peelingDropDownValue,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: _setDropdownColor(peelingDropDownValue),
                        ),
                        onChanged: (String? peelingValue) {
                          setState(() {
                            peelingDropDownValue = peelingValue!;
                          });
                        },
                        items: <String>['None', 'Mild', 'Moderate', 'Severe', 'Unbearable']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [const Text('New sores'),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: DropdownButton<String>(
                        value: soresDropDownValue,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: _setDropdownColor(soresDropDownValue),
                        ),
                        onChanged: (String? soreValue) {
                          setState(() {
                            soresDropDownValue = soreValue!;
                          });
                        },
                        items: <String>['None', 'Mild', 'Moderate', 'Severe', 'Unbearable']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(15, 14, 61, 25))),
              onPressed: () async {
                addAll();
                Navigator.pop(context, _ratings);
              },
              child: const Text('Submit!'),
            )
          ]),
        ],
      ),
    );
  }
}