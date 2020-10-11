import 'package:flutter/material.dart';

class XLargeDataCard extends StatelessWidget {
  String title;
  String subTitle;
  String cardInfo;
  Color cardColor;
  double height;
  double width;

  XLargeDataCard({
    Key key,
    this.title,
    this.subTitle,
    this.cardInfo,
    this.cardColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.15,
      width: width * 0.93,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: Text(
              subTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white38,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            child: Text(
              cardInfo,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
