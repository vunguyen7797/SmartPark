import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:capstone_parking_lot/helper/constants.dart';
import 'package:capstone_parking_lot/helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';

class MapViewPage extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //       backgroundColor: Colors.white,
  //       body: _createStack()
  //   );


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: SpaceWidget(),
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
      heightFactor: 2,
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
            color: Colors.red,
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                // buildParkingSpaceWidget(0.0, 0.0),
                // for (int i = 0; i < testMap.length; i++)
                for (int i = 0; i < 1; i++)
                  Positioned(
                    left: 1243,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 1174,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 1105,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 1036,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 967,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 898,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 829,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 760,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                  Positioned(
                    left: 691,
                    top: 50,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 484,
                  top: 50,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 415,
                  top: 50,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 346,
                  top: 50,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 277,
                  top: 50,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 208,
                  top: 50,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 139,
                  top: 50,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: 70,
                  top: 50,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(59 * 3.1415927 / 180),),
                Positioned(
                  left: -14,
                  top: 130,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(90 * 3.1415927 / 180),),
                  Positioned(
                    left: 1438,
                    top: 791,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                  Positioned(
                    left: 1348,
                    top: 791,
                    height: 60.0,
                    width: 88.0,
                    child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1258,
                  top: 796,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1168,
                  top: 795,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1078,
                  top: 799,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1145,
                  top: 710,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1235,
                  top: 711,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1310,
                  top: 710,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1397,
                  top: 705,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
                Positioned(
                  left: 1479,
                  top: 703,
                  height: 60.0,
                  width: 88.0,
                  child: buildParkingSpaceWidget(-59 * 3.1415927 / 180),),
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
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.cyan]
              )
          ),
        ),
    );
  }
}

// _createStack() {
//   return new Stack(
//       children: <Widget>[
//         // Black square centered in stack
//         new Align(
//           alignment: new Alignment(2328, 1647),
//           child: new Container(
//             height: 30.0,
//             width: 50.0,
//             child: new DecoratedBox(
//               decoration: new BoxDecoration(
//                   color: Colors.red
//               ),
//             ),
//           ),
//         ),
//         new Align(
//           // alignment: Alignment.topLeft,
//           alignment: const Alignment(-1.0, -1.0),
//           child: new Text('Top Left',
//               style: new TextStyle(color: Colors.black)),
//         ),
//         new Align(
//           // alignment: Alignment.bottomRight,
//           alignment: const Alignment(1.0, 1.0),
//           child: new Text('Bottom Right',
//               style: new TextStyle(color: Colors.black)),
//         ),
//         new Align(
//           alignment: new Alignment(-0.8, -0.8),
//           child: new Text(
//               '10% in', style: new TextStyle(color: Colors.black)),
//         ),
//         new Align(
//           alignment: new Alignment(0.8, 0.8),
//           child: new Text(
//               '90% in', style: new TextStyle(color: Colors.black)),
//         ),
//       ]
//   );
// }


// class MapViewPage extends StatelessWidget {
//   // @override
//   // Widget build(BuildContext context) {
//   //   return new Scaffold(
//   //       backgroundColor: Colors.white,
//   //       body: _createStack()
//   //   );
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SpaceWidget(),
//       ),
//     );
//   }
// }
//
// class SpaceWidget extends StatelessWidget {
//   SpaceWidget({Key key}) : super(key: key);
//
//   final testMap = [{"1": 1}, {"0.5": 0.5}, {"0.9": 0.9}, {"-0.5": -0.5}, {"-1": -1}];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: Colors.red,
//       child: Stack(
//         children: <Widget>[
//           buildParkingSpaceWidget(0.0, 0.0),
//           for (int i = 0; i < testMap.length; i++)
//             Positioned(
//               top: (i).toDouble(),
//               left: (i).toDouble(),
//               child: buildParkingSpaceWidget(1.0, 1.0))
//         ],
//       ),
//     );
//   }
// }
//
//   buildParkingSpaceWidget(align1, align2){
//     return  Transform.rotate(
//       angle: 0,
//       alignment: Alignment(0.0, 0.0),
//       child: new Container(
//         height: 30.0,
//         width: 50.0,
//         child: new DecoratedBox(
//           decoration: new BoxDecoration(
//               gradient: LinearGradient(
//                   colors: [Colors.red, Colors.cyan]
//               )
//           ),
//         ),
//       ),
//     );
//   }