import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'dart:math';


class FeelingsStatefulWidget extends StatefulWidget {
  const FeelingsStatefulWidget({Key? key}) : super(key: key);

  @override
  State<FeelingsStatefulWidget> createState() => _EnterFeelings();
}

class _EnterFeelings extends State<FeelingsStatefulWidget> {
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(15, 14, 61, 25));
  static const TextStyle entryStyle = TextStyle(color: Color.fromRGBO(211, 167, 11, 1));

  String pullingDropDownValue = 'None';
  String numbnessDropDownValue = 'None';
  String coldDropDownValue = 'None';
  String walkDropDownValue = 'None';
  String restDropDownValue = 'None';

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
    _ratings.add(pullingDropDownValue);
    _ratings.add(numbnessDropDownValue);
    _ratings.add(coldDropDownValue);
    _ratings.add(walkDropDownValue);
    _ratings.add(restDropDownValue);
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
                'My Feelings',
                style: optionStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [const Text('Leg Pulling'),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: DropdownButton<String>(
                        value: pullingDropDownValue,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: _setDropdownColor(pullingDropDownValue),
                        ),
                        onChanged: (String? pullingValue) {
                          setState(() {
                            pullingDropDownValue = pullingValue!;
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
                children: [const Text('Leg Numbness'),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: DropdownButton<String>(
                        value: numbnessDropDownValue,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: _setDropdownColor(numbnessDropDownValue),
                        ),
                        onChanged: (String? numbnessValue) {
                          setState(() {
                            numbnessDropDownValue = numbnessValue!;
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
                children: [const Text('Cold Feet'),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: DropdownButton<String>(
                        value: coldDropDownValue,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: _setDropdownColor(coldDropDownValue),
                        ),
                        onChanged: (String? coldValue) {
                          setState(() {
                            coldDropDownValue = coldValue!;
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
                children: [const Text('Walking pain'),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: DropdownButton<String>(
                        value: walkDropDownValue,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: _setDropdownColor(walkDropDownValue),
                        ),
                        onChanged: (String? walkValue) {
                          setState(() {
                            walkDropDownValue = walkValue!;
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
                children: [const Text('Resting pain'),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: DropdownButton<String>(
                        value: restDropDownValue,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: _setDropdownColor(restDropDownValue),
                        ),
                        onChanged: (String? restValue) {
                          setState(() {
                            restDropDownValue = restValue!;
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