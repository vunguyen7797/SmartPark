import 'dart:math';

import 'package:capstone_parking_lot/helper/constants.dart';
import 'package:capstone_parking_lot/helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: Scaffold(
        body: SpaceWidget(),
      ),
    );
  }
}

class SpaceWidget extends StatelessWidget {
  SpaceWidget({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // double alignX = 0;
    // double alignY = 0;
    // double spaceAngle = 0;
    // bool occupied = true;
    // for (int i = 0; i < 2; i++){
    //   if (i == 1){
    //     alignX = 1;
    //     alignY = 1;
    //   }
    return Center(
      child: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(double.infinity),
        minScale: 0.1,
        maxScale: 2.5,
        child:
        Transform.rotate(
          angle: 0,
          alignment: Alignment(0.0, 0.0),
          child: new Container(
            height: 30.0,
            width: 50.0,
            child: new DecoratedBox(
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.cyan]
                  )
              ),
            ),
          ),
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