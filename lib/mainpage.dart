import 'package:flutter/material.dart';
import 'package:project_new/Health.dart';
import 'package:project_new/Profile.dart';
import 'package:project_new/report.dart';
import 'user.dart';
import 'package:pedometer/pedometer.dart';

//global variable
String _targetStep = "0";

class HomeScreen extends StatelessWidget {

  String targetStep;
  final List<user> currentUsers;
  HomeScreen({Key key, this.currentUsers, this.targetStep}) : super(key: key);

  int hexColor(String colorCode) {
    String colorstr = '0xff' + colorCode;
    int colorint = int.parse(colorstr);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Row(
            children: [
              TextButton(
                onPressed: () {}, // button press
                child: Text(
                  "TODAY",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(hexColor("8B5B21")),
                      height: 1.5,
                      fontFamily: 'Open Sans'),
                ),
              ),
              Container(
                width: 28,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ReportPage(currentUsers: currentUsers),
                  ));
                },
                child: Text(
                  "REPORT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ),
              Container(
                width: 28,
              ),
              TextButton(
                onPressed: () {
    Navigator.push(context, MaterialPageRoute(
    builder: (context) => Health(currentUsers: currentUsers),
    ));},
                child: Text(
                  "HEALTH",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(hexColor("F6EBE0")),
        elevation: 0.0,
      ),
      body: MyHomePage(currentUsers: currentUsers),
    );
  }
}

class MyHomePage extends StatefulWidget {

  String targetStep;
  final List<user> currentUsers;
  MyHomePage({Key key, this.currentUsers, this.targetStep}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status='?', _steps='?';
  var start = DateTime.now();
  int _countTimeMinute = 0;
  int _countTimeHour = 0;
  //String targetStep = "0";

  //Step Counter part
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
      _countTimeMinute = DateTime.now().minute - start.minute;
      // while(_countTimeMinute > 60){
      //   _countTimeHour = _countTimeHour + 1;
      //   _countTimeMinute = _countTimeMinute - 60;
      // }
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }
  // end step counter part

  int hexColor(String colorCode) {
    String colorstr = '0xff' + colorCode;
    int colorint = int.parse(colorstr);
    return colorint;
  }
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: [
          Container(
            child: IconButton(
              icon: Image.asset('assets/image/profile.png'),
              iconSize: 50,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => ProfilePage(currentUsers: widget.currentUsers),
                ),
                );
              },
              alignment: Alignment.topRight,
            ),
            alignment: Alignment.topRight,
          ),
          IconButton(
              icon: Image.asset('assets/image/dogpreview.png'),
              onPressed: () {},
              iconSize: 210,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(0.0)),
          Container(
            child: Center(
                child: Image.asset(
                  'assets/image/Fill_Heart.png',
                  height: 60,
                  width: 200,
                  fit: BoxFit.fitWidth,
                )),
            padding: const EdgeInsets.all(0.0),
          ),
          Text(
            'Today Step:',
            style: TextStyle(
                height: 0.77,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _steps,
            style: TextStyle(
                height: 0.77,
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Today Goal:',
            style: TextStyle(
                height: 0.77,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(
                builder: (context) => changeStep(targetStep: _targetStep, currentUsers: widget.currentUsers,),
              ),
              );
            },
            child: Text(_targetStep.toString(),
            style: TextStyle(
                height: 0.77,
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            textAlign: TextAlign.center,
            )
          ),
          Container(
            height: 188,
            child: Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 2, 5, 1),
                          child: Image.asset(
                            'assets/image/distance-removebg.png',
                            height: 70,
                            width: 70,
                            alignment: Alignment.center,
                          ),
                        ),
                        Text(
                          kilometerCalculator(_steps),
                          style: TextStyle(
                              fontSize: 18,
                              height: 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'KM.',
                          style: TextStyle(
                              fontSize: 18,
                              height: 1,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(55, 2, 5, 1),
                          child: Image.asset(
                            'assets/image/Fire-removebg.png',
                            height: 70,
                            width: 70,
                            alignment: Alignment.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(55, 2, 5, 1),
                          child: Text(
                            caloriesCalculate(_steps, widget.currentUsers),
                            style: TextStyle(
                                fontSize: 18,
                                height: 2,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(55, 2, 5, 1),
                          child: Text(
                            'Kcal',
                            style: TextStyle(
                                fontSize: 18,
                                height: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(55, 2, 5, 1),
                          child: Image.asset(
                            'assets/image/Clock-removebg.png',
                            height: 70,
                            width: 70,
                            alignment: Alignment.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(55, 2, 5, 1),
                          child: Text(
                            _countTimeMinute.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                height: 2,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(55, 2, 5, 1),
                          child: Text(
                            'Min',
                            style: TextStyle(
                                fontSize: 18,
                                height: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                color: Colors.brown[200],
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0)),
          )
        ],
      ),
      decoration: BoxDecoration(color: Color(hexColor("F6EBE0"))),
        ));
  }

  caloriesCalculate(String _step, List<user> currentUser){
    double calories = 0;
    try {
      if (int.parse(currentUser[0].weight) < 55) {
        calories = int.parse(_steps) * 0.028;
      }
      else if (int.parse(currentUser[0].weight) >= 55 &&
          int.parse(currentUser[0].weight) < 64) {
        calories = int.parse(_steps) * 0.033;
      }
      else if (int.parse(currentUser[0].weight) >= 64 &&
          int.parse(currentUser[0].weight) < 73) {
        calories = int.parse(_steps) * 0.038;
      }
      else if (int.parse(currentUser[0].weight) >= 73 &&
          int.parse(currentUser[0].weight) < 82) {
        calories = int.parse(_steps) * 0.044;
      }
      else if (int.parse(currentUser[0].weight) >= 82 &&
          int.parse(currentUser[0].weight) < 91) {
        calories = int.parse(_steps) * 0.049;
      }
      else if (int.parse(currentUser[0].weight) >= 91 &&
          int.parse(currentUser[0].weight) < 100) {
        calories = int.parse(_steps) * 0.055;
      }
      else if (int.parse(currentUser[0].weight) >= 100 &&
          int.parse(currentUser[0].weight) < 114) {
        calories = int.parse(_steps) * 0.06;
      }
      else if (int.parse(currentUser[0].weight) >= 114 &&
          int.parse(currentUser[0].weight) < 125) {
        calories = int.parse(_steps) * 0.069;
      }
      else if (int.parse(currentUser[0].weight) >= 125 &&
          int.parse(currentUser[0].weight) < 136) {
        calories = int.parse(_steps) * 0.075;
      }
      else if (int.parse(currentUser[0].weight) >= 136) {
        calories = int.parse(_steps) * 0.082;
      }
    }catch(err){
      return "0";
    }

    return calories.toString();
  }

  kilometerCalculator(String _step){
    // if (int.parse(_step) is error){
    //   return 0;
    // }
    double kilometer = 0;
    try{
      kilometer = int.parse(_steps) * 0.000762;
    }catch(err){
      return "0";
    }
    return kilometer.toString();
  }
}

class changeStep extends StatelessWidget {

  final List<user> currentUsers;
  String targetStep;
  changeStep({Key key, this.targetStep, this.currentUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: ListView(
        children: [
          Center(
          child: TextField(
            onChanged: (value) {
              _targetStep = value;
            },
          ),
        ),
          Center(
            child: RaisedButton(
              child: Text("Confirm"),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(
                  builder: (context) => HomeScreen(targetStep: _targetStep, currentUsers: currentUsers,),
                ),
                );
               }
            )
          )
    ]
    ));
  }
}
