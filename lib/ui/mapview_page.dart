import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:capstone_parking_lot/helper/constants.dart';
import 'package:capstone_parking_lot/helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';

class MapViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: SpaceWidget(
          ),
        ),
      ),
    );
  }
}

class SpaceWidget extends StatefulWidget {
  SpaceWidget({Key key}) : super(key: key);

  @override
  _SpaceWidgetState createState() => _SpaceWidgetState();
}

class _SpaceWidgetState extends State<SpaceWidget> {
  // final testMap = [{"0": 0}, {"1": 1}, {"0.5": 0.5}, {"0.9": 0.9}, {"-0.5": -0.5}, {"-1": -1}, {"-2": -2}, {"-3": -3}];
  var testMap = [{"0", 0}, {"-1": -1}, {"1": 1}, {"2": 2}, {"5": 5}, {"10": 10}];
  double x = 0.0;
  double y = 0.0;
  @override
  Widget build(BuildContext context) {

    const double markerHeight = 50.0;
    double ymax = context.findRenderObject()?.paintBounds?.bottom ?? markerHeight;
    // return  InteractiveViewer(
    //     panEnabled: true, // Set it to false
    //     boundaryMargin: EdgeInsets.all(100),
    //     minScale: 0.1,
    //     maxScale: 2,
    return FractionallySizedBox(
      widthFactor: 4,
      heightFactor: 3,
      child: GestureDetector(
        onPanUpdate: (p) {
          setState(() {
            x += p.delta.dx;
            y = (y+p.delta.dy) >ymax - markerHeight ? ymax -markerHeight : y+p.delta.dy;
          });
        },
        child: Transform(
          transform: Matrix4.translationValues(x, y, 0.0),
          child: Container(
            color: Colors.white,
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                // buildParkingSpaceWidget(0.0, 0.0),
                // for (int i = 0; i < testMap.length; i++)
                //Top row
                for (int i = 0; i < 1; i++)
                  Positioned(
                    left: 1353,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 1284,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 1215,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 1146,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 1077,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 1008,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 939,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 870,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 801,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 594,
                  top: 50,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 525,
                  top: 50,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 456,
                  top: 50,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 387,
                  top: 50,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 318,
                  top: 50,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 249,
                  top: 50,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 180,
                  top: 50,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),

                //Side top row
                Positioned(
                  left: -14,
                  top: 160,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(90 * 3.1415927 / 180),),
                Positioned(
                  left: -14,
                  top: 248,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(90 * 3.1415927 / 180),),
                Positioned(
                  left: -14,
                  top: 336,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(90 * 3.1415927 / 180),),

                  //2nd row
                Positioned(
                  left: 1353,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1284,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1215,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1146,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1077,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1008,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 939,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 870,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 801,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 732,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 663,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 594,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 525,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 456,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 387,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 318,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 249,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 180,
                  top: 250,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),

              //  Third Row
                Positioned(
                  left: 1377,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1309,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1240,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1171,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1102,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1032,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 962,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 893,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 824,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 755,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 686,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 617,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 548,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 480,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 412,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 342,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 274,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 204,
                  top: 325,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),

                //4th row
                Positioned(
                  left: 1353,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1284,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1215,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1146,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1077,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1008,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 939,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 870,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 801,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 732,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 663,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 594,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 525,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 456,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 387,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 318,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 249,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 180,
                  top: 525,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),

                //  Fifth Row
                Positioned(
                  left: 1397,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1329,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1260,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1191,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1122,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1052,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 982,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 913,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 844,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 775,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 706,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 637,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 568,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 500,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 432,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 362,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 293,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 225,
                  top: 600,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),

                //6th row
                Positioned(
                  left: 1353,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1284,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1215,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1146,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1077,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1008,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 939,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 870,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 801,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 732,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 663,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 594,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 525,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 456,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 387,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 318,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 249,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 180,
                  top: 800,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),

                //  7th Row
                Positioned(
                  left: 1397,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1329,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1260,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1191,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1122,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 1052,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 982,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 913,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 844,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 775,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 706,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 637,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 568,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 500,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 432,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 362,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 293,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 225,
                  top: 875,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),

                //8th
                Positioned(
                  left: 1353,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1284,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1215,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1146,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1077,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1008,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 939,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 870,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 801,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 732,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 663,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 594,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 525,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 456,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 387,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 318,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 249,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 180,
                  top: 1075,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),

                //  9th Row
                Positioned(
                  left: 1377,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1309,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1240,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1171,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1102,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1032,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 962,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 893,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 824,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 755,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 686,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 617,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 548,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 480,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 412,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 342,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 274,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 204,
                  top: 1150,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),

                //  10th Row
                Positioned(
                  left: 824,
                  top: 1350,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 755,
                  top: 1350,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 686,
                  top: 1350,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 617,
                  top: 1350,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 548,
                  top: 1350,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 480,
                  top: 1350,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 412,
                  top: 1350,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 342,
                  top: 1350,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 274,
                  top: 1350,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 204,
                  top: 1350,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildParkingSpaceWidget(angle){
    return  Transform.rotate(
      angle: angle,
        child: new DecoratedBox(
          decoration: new BoxDecoration(
                  color: Colors.green,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15.0)
          ),
        ),
    );
  }
}