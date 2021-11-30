import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/visuals.dart';
import 'dart:math';
import 'enter.dart';
import 'feelings.dart';
import 'help.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'medications.dart';

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  int _selectedIndex = 0;
  List<String> texts = ["0", "0", "0"];
  List<bool?> checks = [false, false, false, false];
  List<String> visualRatings = ["None", "None", "None", "None"];
  List<String> feelingRatings = ["None", "None", "None", "None", "None"];
  double visualNumber = 0;
  double feelingNumber = 0;
  int activityNumber = 0;
  int medicationNumber = 0;
  String day = '${DateTime.now().month} ${'/'} ${DateTime.now().day} ${'/'} ${DateTime.now().year}';

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(211, 167, 11, 1));
  static const TextStyle tipHeaderStyle = TextStyle(fontSize: 60, color: Color.fromRGBO(211, 167, 11, 1), fontWeight: FontWeight.bold);
  static const TextStyle tipStyle = TextStyle(fontSize: 30, color: Color.fromRGBO(211, 167, 11, 1));
  static const TextStyle subtitleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w200, color: Color.fromRGBO(211, 167, 11, 1));
  static const TextStyle regularStyle = TextStyle(color: Color.fromRGBO(211, 167, 11, 1));
  static const TextStyle metricStyle = TextStyle(color: Color.fromRGBO(211, 167, 11, 1), fontWeight: FontWeight.bold);

  final List<String> questions = ["What Does Claudication Mean?", "What is Restenosis?", "Smart Stents Detect Narrowing Arteries", "Keep Your Veins Healthy by Eating Lots of Fiber", "Why is Artherosclerosis Important?", "What is the Difference Between and Artery and a Vein?"];
  final Map<String, String?> tips = {"What Does Claudication Mean?" : "Claudication is pain in your thigh or calf that happens when you walk, it can make you limp. As it gets worse, the pain occurs when you walk shorter distances. Over time, it can become too painful to even walk. It is usually a symptom of PAD. Types of claudication include feelings of pain, burning feeling, or a tired feeling in the legs. The leg may become pale when raised and red when lowered. There may also be cold feet. Blockages in the leg are most common in the thigh and behind the knee. Tip: Pain in the legs when you are resting is a sign that your blocked arteries have become worse. Speak to your doctor promptly.",
    "What is Restenosis?" : "Restenosis means that the blocked artery that was opened up with angioplasty or a stent has become narrowed again.  It is a gradual re-narrowing of the artery and is caused by overgrowth of scar tissue. It is usually treated with another stent or angioplasty using a balloon. It occurs often in patients within 6-12 months after a stent is placed.",
  "Smart Stents Detect Narrowing Arteries" : "Researchers at the University of British Columbia have figured out that stents could do a lot more than just be a tube inside an artery.  They have created a ‘smart stent’ empowered with sensors that can monitor and provide real-time feedback on blood flow. The feedback can detect re-narrowing of a stented artery.",
    "Keep Your Veins Healthy by Eating Lots of Fiber" : "Fiber is important in keeping veins healthy.  It is a key nutrient to help keep your digestive system working correctly and keeps pressure from building up in your abdomen. More abdomen pressure means your veins will suffer due to blockage of blood flow to your veins. Reach for foods such as: Popcorn, Oatmeal, Brown Rice, Leafy greens, Broccoli, Avocado, Chia seeds, Lentils",
    "Why is Artherosclerosis Important?" : "Artherosclerosis is also called ‘hardening of the arteries’.  It occurs when fat and cholesterol build up in the walls of the arteries.  These deposits are called plaque and plaque can narrow and even block the arteries. This makes it harder for the oxygen rich blood to flow through them.",
    "What is the Difference Between and Artery and a Vein?" : "Arteries are blood vessels that carry oxygen rich blood away from the heart and to the body. Veins are blood vessels that carry blood from the body back into the heart.",
  };
  MaterialColor _setActivtyColor(int minutesWalked) {
    activityNumber = minutesWalked;
    if (minutesWalked <= 10) {
      return Colors.red;
    } else if (minutesWalked <= 20) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
  MaterialColor _setMedicationColor() {
    var bools = checks;
    int numTrue = bools.where((item) => item == true).length;
    medicationNumber = numTrue;

    if (numTrue == 0) {
      return Colors.red;
    } else if (numTrue <= 2) {
      return Colors.orange;
    } else if (numTrue == 3) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }
  Map<String, double> ratingMap = {"None" : 0, "Mild" : 1, "Moderate" : 2, "Severe" : 3, "Unbearable" : 4};
  MaterialColor _setFeelingColor() {
    List<String> feelings = feelingRatings;
    double score = 0;
    for (String s in feelings) {
      score += ratingMap[s]!;
    }

    score /= 4;
    feelingNumber = score;

    if (score < 1) {
      return Colors.green;
    } else if (score < 2) {
      return Colors.yellow;
    } else if (score < 3) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
  MaterialColor _setVisualColor() {
    List<String> visuals = visualRatings;
    double score = 0;
    for (String s in visuals) {
      score += ratingMap[s]!;
    }

    score /= 5;
    visualNumber = score;

    if (score < 1) {
      return Colors.green;
    } else if (score < 2) {
      return Colors.yellow;
    } else if (score < 3) {
      return Colors.orange;
    } else if (score < 4) {
      return Colors.deepOrange;
    } else {
      return Colors.red;
    }
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _navigatetoEnter(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final data = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => const EnterStatefulWidget()),
    );

     texts = data;
  }
  void _navigatetoMedications(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final data = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => const MedicationsStatefulWidget()),
    );

    checks = data;
  }
  void _navigatetoVisuals(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final data = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => const VisualsStatefulWidget()),
    );

    visualRatings = data;
  }
  void _navigatetoFeelings(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final data = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => const FeelingsStatefulWidget()),
    );

    feelingRatings = data;
  }
  int _getNumberFromString(String element) {
    if (element == "0") {
      return 0;
    } else {
      return int.parse(element);
    }
  }
  void _navigatetoHelp(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpStatefulWidget()));
  }
  setDates() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> dates = preferences.getStringList("dates") ?? [""];
    dates.add(day);
    preferences.setStringList("dates", dates);
  }
  getDates() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> dates = preferences.getStringList("dates") ?? [""];
    return dates;
  }
  @override
  Widget build(BuildContext context) {

    Random r = Random();
    int randomNumber = r.nextInt(questions.length);
    String question = questions.elementAt(randomNumber);

    var dailyExercise = _getNumberFromString(texts.elementAt(0)) + _getNumberFromString(texts.elementAt(1));

    final List<Widget> _widgetOptions = <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Good Afternoon, SP", style: subtitleStyle,),
              ),
                Text(
                    '${DateTime.now().month} ${'/'} ${DateTime.now().day} ${'/'} ${DateTime.now().year}',
                    style: optionStyle),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Column(children: [const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Activity", style: metricStyle),
            ), RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: _setActivtyColor(dailyExercise),
              child: Text("$dailyExercise/20"),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            )],),
              Column(
                children: [ const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Visual", style: metricStyle),
                ),
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: _setVisualColor(),
                    child: Text("$visualNumber"),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                ],
              ),
              Column(
                children: [const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Feeling", style: metricStyle),
                ),
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: _setFeelingColor(),
                    child: Text("$feelingNumber"),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                ],
              ),
              Column(
                children: [const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Medications", style: metricStyle),
                ),
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: _setMedicationColor(),
                    child: Text("${checks.where((item) => item == true).length}/4"),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      ListView(children: [Table(border: TableBorder.all(),children: <TableRow>[TableRow(children: <Widget>[Text("Date", style: optionStyle,), Text("Activity", style: optionStyle), Text("Feeling", style: optionStyle,), Text("Visual", style: optionStyle), Text("Medications", style: optionStyle),
      ]), TableRow(children: <Widget>[Text("11/21/2021", style: optionStyle,), Text("12", style: optionStyle), Text("2.3", style: optionStyle,), Text("4.0", style: optionStyle), Text("3", style: optionStyle),
      ]), TableRow(children: <Widget>[Text("11/20/2021", style: optionStyle,), Text("24", style: optionStyle), Text("3.5", style: optionStyle,), Text("3.8", style: optionStyle), Text("4", style: optionStyle),
      ]), TableRow(children: <Widget>[Text("11/20/2021", style: optionStyle,), Text("24", style: optionStyle), Text("3.5", style: optionStyle,), Text("3.8", style: optionStyle), Text("4", style: optionStyle),
      ])], )]),
      ListView(
        children: [Center(
          child: Column(
            children: [Text(question, style: tipHeaderStyle,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
                child: Text(
                  "${tips[question]}", style: tipStyle,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        )],
      ),
    ];

    void onSelected (BuildContext context, int item) {
      switch (item) {
        case 0:
          _navigatetoEnter(context);
          return;
        case 1:
          _navigatetoMedications(context);
          return;
        case 2:
          _navigatetoVisuals(context);
          return;
        case 3:
          _navigatetoFeelings(context);
          return;
      }
    }


    return SafeArea(child: Scaffold(
      backgroundColor: const Color.fromRGBO(15, 14, 61, 25),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 14, 61, 25),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: GestureDetector(
            onTap: () async {
              _navigatetoHelp(context);
            },
            child: const Icon(Icons.question_answer, color: Color.fromRGBO(211, 167, 11, 1),),

          ),
        ),
        title: const Text('PeriTrac', style: regularStyle),
        actions: <Widget>[
          PopupMenuButton<int>(
            icon: const Icon(Icons.add, color: Color.fromRGBO(211, 167, 11, 1),),
            color: Color.fromRGBO(211, 167, 11, 1),
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem(value: 0, child: Text("Physical")),
              PopupMenuItem(value: 1, child: Text("Medications")),
              PopupMenuItem(value: 2, child: Text("Visuals")),
              PopupMenuItem(value: 3, child: Text("Feelings"))
            ],
          )
          ,

        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(15, 14, 61, 25),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromRGBO(211, 167, 11, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'My Trend',
            backgroundColor: Color.fromRGBO(211, 167, 11, 1),
          ),
          // quick log
          // journal
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Tip of the Day',
            backgroundColor: Color.fromRGBO(211, 167, 11, 1),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(211, 167, 11, 1),
        onTap: _onItemTapped,
      ),
    ));

  }
}

