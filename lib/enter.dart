import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class EnterStatefulWidget extends StatefulWidget {
  const EnterStatefulWidget({Key? key}) : super(key: key);

  @override
  State<EnterStatefulWidget> createState() => _EnterData();
}

class _EnterData extends State<EnterStatefulWidget> {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(15, 14, 61, 25));
  static const TextStyle entryStyle = TextStyle(color: Color.fromRGBO(211, 167, 11, 1));


  final TextEditingController _walkController = TextEditingController();
  final TextEditingController _exerciseController = TextEditingController();
  final TextEditingController _painController = TextEditingController();
  final TextEditingController _otherController = TextEditingController();
  List<String> _controllerTexts = <String>[];

  void addAll() {
    _controllerTexts.add(_walkController.text);
    _controllerTexts.add(_exerciseController.text);
    _controllerTexts.add(_painController.text);
    _controllerTexts.add(_otherController.text);
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
                  'My Physical Activity',
                  style: optionStyle,
                )), // My Physical Activity
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _walkController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'How many minutes did you walk?',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: TextField(
                controller: _exerciseController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'How many minutes of other exercise did you do?',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _painController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'How many minutes before you had pain?',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(15, 14, 61, 25))),
                onPressed: () {
                  addAll();
                  Navigator.pop(context, _controllerTexts);
                },
                child: const Text('Submit!'),
              ),
            )
          ]),
        ],
      ),
    );
  }
}





