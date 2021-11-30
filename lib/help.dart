import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class HelpStatefulWidget extends StatefulWidget {
  const HelpStatefulWidget({Key? key}) : super(key: key);

  @override
  State<HelpStatefulWidget> createState() => _HelpData();
}

class _HelpData extends State<HelpStatefulWidget> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(211, 167, 11, 1));
  static const TextStyle regularStyle = TextStyle(color: Color.fromRGBO(211, 167, 11, 1));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(15, 14, 61, 25),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(15, 14, 61, 25),
          iconTheme: IconThemeData(color: const Color.fromRGBO(211, 167, 11, 1)),
          title: const Text("Help", style: regularStyle,),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Activity",
                      style: optionStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        "Total number of minutes exercised today", style: regularStyle),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Visual",
                      style: optionStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Average score of visual questions today", style: regularStyle,),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Feeling",
                      style: optionStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Average score of feeling questions today", style: regularStyle,),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Medications",
                      style: optionStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Number of medications taken today", style: regularStyle,),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
