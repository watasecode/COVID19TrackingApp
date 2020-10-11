import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TotalOverviewChart extends StatefulWidget {
  final height;
  final width;
  final data;

  TotalOverviewChart({
    Key key,
    this.height,
    this.width,
    this.data,
  });

  @override
  _TotalOverviewChartState createState() => _TotalOverviewChartState();
}

class _TotalOverviewChartState extends State<TotalOverviewChart> {
  @override
  Widget build(BuildContext context) {
    double getMonthlyCases(int days) {
      var casesForDay = widget.data[days]['positive'];
      if (casesForDay == null) {
        casesForDay = 0.0;
      } else {
        casesForDay = casesForDay.toDouble();
      }
      return casesForDay;
    }

    String simplifyDate(int days) {
      var date = widget.data[days]['date'].toString();
      var simpDate = '${date.substring(date.length - 4, date.length - 2)}' +
          '/' +
          '${date.substring(date.length - 2, date.length)}';
      return simpDate;
    }

    double getMaxYValue() {
      var maxYValue = widget.data[0]['positive'].toDouble();
      return maxYValue;
    }

    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: EdgeInsets.all(20),
      width: widget.width * 0.9,
      height: widget.height * 0.4,
      decoration: BoxDecoration(
        color: Color(0xff352D60),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Total Overview:',
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: widget.width,
            // color: Colors.red,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: false,
                ),
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                    showTitles: true,
                    textStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 10,
                    ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 0:
                          return simplifyDate(208);
                        case 1:
                          return simplifyDate(180);
                        case 2:
                          return simplifyDate(150);
                        case 3:
                          return simplifyDate(120);
                        case 4:
                          return simplifyDate(90);
                        case 5:
                          return simplifyDate(60);
                        case 6:
                          return simplifyDate(30);
                        case 7:
                          return simplifyDate(0);
                      }
                      return '';
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                borderData: FlBorderData(
                  border: Border.all(width: 0),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, getMonthlyCases(208)),
                      FlSpot(1, getMonthlyCases(180)),
                      FlSpot(2, getMonthlyCases(150)),
                      FlSpot(3, getMonthlyCases(120)),
                      FlSpot(4, getMonthlyCases(90)),
                      FlSpot(5, getMonthlyCases(60)),
                      FlSpot(6, getMonthlyCases(30)),
                      FlSpot(7, getMonthlyCases(0)),
                    ],
                    colors: [Color(0xff6FCF97)],
                    isCurved: true,
                    barWidth: 3,
                  ),
                ],
                minX: 0,
                maxX: 7,
                maxY: getMaxYValue(),
                minY: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
