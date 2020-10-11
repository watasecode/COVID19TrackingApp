import 'package:flutter/material.dart';

class SmallDataCard extends StatelessWidget {
  String title;
  String subTitle;
  String cardData;
  Color cardColor;
  final height;
  final width;

  SmallDataCard({
    Key key,
    this.title,
    this.subTitle,
    this.cardData,
    this.cardColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: height * 0.15,
      width: width * 0.28,
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
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
          Positioned(
            top: 15,
            child: Text(
              subTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.white38,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Text(
              cardData,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
