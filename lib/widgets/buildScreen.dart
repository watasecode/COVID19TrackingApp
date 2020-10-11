import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:Covid19App/totalOverviewChart.dart';
// import 'package:Covid19App/xLargeCardWidget.dart';
import 'package:flutter/material.dart';

import './xLargeCardWidget.dart';
import './largeCardWidget.dart';
import './smallCardWidget.dart';
import '../data/statesData.dart';
import './weeklyOverviewChart.dart';
import './totalOverviewChart.dart';

class BuildData extends StatefulWidget {
  final futureData;
  final bool todayView;

  BuildData({
    Key key,
    this.futureData,
    this.todayView,
  });

  @override
  _BuildDataState createState() => _BuildDataState();
}

class _BuildDataState extends State<BuildData> {
  String stateSelected = 'hi';
  Future getData() async {
    var url =
        'https://api.covidtracking.com/v1/states/$stateSelected/daily.json';
    var response = await http.get(url);
    var stateData = jsonDecode(response.body);
    return stateData;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Widget buildScreen() {
      return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (widget.todayView == false) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.07,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'State: ${snapshot.data[0]['state']}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Last Update: ${snapshot.data[0]['lastUpdateEt']}',
                                style: TextStyle(
                                    color: Colors.black26, fontSize: 12),
                              ),
                            ],
                          ),
                          FlatButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return ListView.builder(
                                    itemCount: 50,
                                    itemBuilder: (context, index) {
                                      var abrv = states[index]['abrv'];
                                      return ListTile(
                                        title: Text(states[index]['name']),
                                        onTap: () {
                                          print(abrv);
                                          stateSelected = abrv;
                                          setState(() {
                                            buildScreen();
                                          });
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            child: Text('Change State'),
                            textColor: Colors.blue[300],
                          ),
                        ],
                      ),
                    ),
                    XLargeDataCard(
                      height: height,
                      width: width,
                      title: 'Cases',
                      subTitle: 'Total',
                      cardColor: Color(0xff6FCF97),
                      cardInfo: '${snapshot.data[0]['positive']}',
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    XLargeDataCard(
                      height: height,
                      width: width,
                      title: 'Deaths',
                      subTitle: 'Total',
                      cardColor: Color(0xffEB5757),
                      cardInfo: '${snapshot.data[0]['death']}',
                    ),
                    TotalOverviewChart(
                      height: height,
                      width: width,
                      data: snapshot.data,
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: width,
                      height: height * 0.07,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'State: ${snapshot.data[0]['state']}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Last Update: ${snapshot.data[0]['lastUpdateEt']}',
                                style: TextStyle(
                                    color: Colors.black26, fontSize: 12),
                              ),
                            ],
                          ),
                          FlatButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return ListView.builder(
                                    itemCount: 50,
                                    itemBuilder: (context, index) {
                                      var abrv = states[index]['abrv'];
                                      return ListTile(
                                        title: Text(states[index]['name']),
                                        onTap: () {
                                          print(abrv);
                                          stateSelected = abrv;
                                          setState(() {
                                            buildScreen();
                                          });
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            child: Text('Change State'),
                            textColor: Colors.blue[300],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LargeDataCard(
                          height: height,
                          width: width,
                          title: 'Cases:',
                          subTitle: 'Today',
                          cardInfo: '${snapshot.data[0]['positiveIncrease']}',
                          cardColor: Color(0xff6FCF97),
                        ),
                        LargeDataCard(
                          height: height,
                          width: width,
                          title: 'Deaths:',
                          subTitle: 'Today',
                          cardInfo: '${snapshot.data[0]['deathIncrease']}',
                          cardColor: Color(0xffEB5757),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SmallDataCard(
                          title: 'Hospitalized:',
                          subTitle: 'Today',
                          height: height,
                          width: width,
                          cardData:
                              '${snapshot.data[0]['hospitalizedCurrently']}',
                          cardColor: Color(0xff6088D6),
                        ),
                        SmallDataCard(
                          title: 'ICU:',
                          subTitle: 'Today',
                          height: height,
                          width: width,
                          cardData: snapshot.data[0]['inIcuCurrently'] != null
                              ? '${snapshot.data[0]['inIcuCurrently']}'
                              : 'N/A',
                          cardColor: Color(0xffF2994A),
                        ),
                        SmallDataCard(
                          title: 'Ventilator:',
                          subTitle: 'Today',
                          height: height,
                          width: width,
                          cardData: snapshot.data[0]['onVentilatorCurrently'] !=
                                  null
                              ? '${snapshot.data[0]['onVentilatorCurrently']}'
                              : 'N/A',
                          cardColor: Color(0xff6FCFCF),
                        ),
                      ],
                    ),
                    WeeklyOverviewChart(
                      data: snapshot.data,
                      height: height,
                      width: width,
                    ),
                  ],
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Color(0xff352D60),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff6FCF97)),
                strokeWidth: 6,
              ),
            );
          }
        },
      );
    }

    return buildScreen();
  }
}
