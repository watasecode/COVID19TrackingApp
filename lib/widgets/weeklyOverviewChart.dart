import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WeeklyOverviewChart extends StatelessWidget {
  final height;
  final width;
  final data;

  double getCaseData(int index, data) {
    var caseData = data[index]['positiveIncrease'].toDouble();
    return caseData;
  }

  WeeklyOverviewChart({
    Key key,
    this.height,
    this.width,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    String getDate(int index) {
      String dateData = data[index]['date'].toString();
      String date =
          '${dateData.substring(dateData.length - 4, dateData.length - 2)}' +
              '/' +
              '${dateData.substring(dateData.length - 2, dateData.length)}';
      return date;
    }

    double getMaxYValue() {
      List<double> weeklyValues = [];
      for (var i = 0; i < 7; i += 1) {
        double casesForDate = data[i]['positiveIncrease'].toDouble();
        weeklyValues.add(casesForDate);
      }
      double maxYValue = weeklyValues.reduce(max);
      return maxYValue + (maxYValue * 0.15);
    }

    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
      width: width * 0.9,
      height: height * 0.4,
      decoration: BoxDecoration(
        color: Color(0xff352D60),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            'Weekly Overview:',
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
          BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceBetween,
              maxY: getMaxYValue(),
              barTouchData: BarTouchData(
                enabled: false,
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  tooltipBottomMargin: 0,
                  getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                  ) {
                    return BarTooltipItem(
                      rod.y.round().toString(),
                      TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  textStyle: TextStyle(
                      color: const Color(0xff7589a2),
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                  margin: 10,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return getDate(0);
                      case 1:
                        return getDate(1);
                      case 2:
                        return getDate(2);
                      case 3:
                        return getDate(3);
                      case 4:
                        return getDate(4);
                      case 5:
                        return getDate(5);
                      case 6:
                        return getDate(6);
                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(showTitles: false),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: [
                BarChartGroupData(
                  x: 6,
                  barRods: [
                    BarChartRodData(
                      y: getCaseData(6, data),
                      color: Color(0xff6FCF97),
                    ),
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 5,
                  barRods: [
                    BarChartRodData(
                      y: getCaseData(5, data),
                      color: Color(0xff6FCF97),
                    ),
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: [
                    BarChartRodData(
                      y: getCaseData(4, data),
                      color: Color(0xff6FCF97),
                    ),
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(
                      y: getCaseData(3, data),
                      color: Color(0xff6FCF97),
                    ),
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(
                      y: getCaseData(2, data),
                      color: Color(0xff6FCF97),
                    ),
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                      y: getCaseData(1, data),
                      color: Color(0xff6FCF97),
                    ),
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      y: getCaseData(0, data),
                      color: Color(0xff6FCF97),
                    ),
                  ],
                  showingTooltipIndicators: [0],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
