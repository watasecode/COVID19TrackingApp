import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

import './widgets/buildScreen.dart';
// import './stateWidget.dart';

void main() {
  runApp(CovidApp());
}

class CovidApp extends StatefulWidget {
  CovidApp({Key key}) : super(key: key);

  @override
  _CovidAppState createState() => _CovidAppState();
}

class _CovidAppState extends State<CovidApp> {
  Widget buildScreen() {
    return BuildData(
      // futureData: getData(),
      todayView: todayView,
    );
  }

  //Set the today view as default view. Will be toggle with buttons
  bool todayView = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff211C3D),
        body: SafeArea(
          child: Column(
            children: [
              //Hold the 2 overview buttons. Total overview and Today overview
              Container(
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      top: 12,
                      left: todayView == false ? 105 : 192,
                      child: Container(
                        height: 24,
                        width: 75,
                        decoration: BoxDecoration(
                          color: Color(0xff352D60),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.white54,
                          ),
                          onPressed: () {
                            setState(() {
                              buildScreen();
                            });
                          },
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        FlatButton(
                            onPressed: () {
                              setState(() {
                                todayView = false;
                                // print(todayView);
                              });
                            },
                            child: Text('Total',
                                style: TextStyle(color: Colors.white))),
                        FlatButton(
                            onPressed: () {
                              setState(() {
                                todayView = true;
                                // print(todayView);
                              });
                            },
                            child: Text('Today',
                                style: TextStyle(color: Colors.white))),
                      ],
                    ),
                  ],
                ),
              ),
              buildScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
