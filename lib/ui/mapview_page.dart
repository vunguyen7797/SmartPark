import 'package:capstone_parking_lot/helper/constants.dart';
import 'package:capstone_parking_lot/helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 2 * SizeConfig.heightMultiplier,),
              Text('Map View', style: GoogleFonts.rubik(
                color: ColorPalette.PrimaryColor,
                fontSize:3 * SizeConfig.textMultiplier,
                fontWeight: FontWeight.w500,
              ), ),
              SizedBox(height: 3 * SizeConfig.heightMultiplier,),
              Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                            color: ColorPalette.PrimaryColor,
                            border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Image.asset('res/images/PngItem_5112270.png'),
                              ),
                            )
                          ),
                        ), Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                              color: ColorPalette.PrimaryColor,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Image.asset('res/images/PngItem_5112270.png'),
                                ),
                              )
                          ),
                        ),Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                              color: Colors.green,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                            child: Text(
                              'L-3',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2 * SizeConfig.textMultiplier
                              ),
                            ),
                          ),
                        ),Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                              color: Colors.green,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                            child: Text(
                              'L-4',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2 * SizeConfig.textMultiplier
                              ),
                            ),
                          ),
                        ), Container(
          height: 10 * SizeConfig.heightMultiplier,
          width: MediaQuery.of(context).size.width/3,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
              color: Colors.blue,
              border: Border.all(color: Colors.black)
          ),
          child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Image.asset('res/images/PngItem_5112270.png'),
                ),
              )
          ),
        ),Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                              color: Colors.green,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                            child: Text(
                              'L-6',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2 * SizeConfig.textMultiplier
                              ),
                            ),
                          ),
                        ),Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                              color: Colors.green,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                            child: Text(
                              'L-7',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2 * SizeConfig.textMultiplier
                              ),
                            ),
                          ),
                        ), Container(
          height: 10 * SizeConfig.heightMultiplier,
          width: MediaQuery.of(context).size.width/3,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
              color: ColorPalette.PrimaryColor,
              border: Border.all(color: Colors.black)
          ),
          child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Image.asset('res/images/PngItem_5112270.png'),
                ),
              )
          ),
        ),Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                              color: Colors.green,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                            child: Text(
                              'L-9',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2 * SizeConfig.textMultiplier
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width/3,
                          child: Icon(Icons.arrow_upward, color: Colors.black, size: 5 * SizeConfig.textMultiplier,),
                        ),
                        Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width/3,
                          child: Icon(Icons.arrow_upward, color: Colors.black, size: 5 * SizeConfig.textMultiplier,),
                        ),
                        Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width/3,
                          child: Icon(Icons.arrow_upward, color: Colors.black, size: 5 * SizeConfig.textMultiplier,),
                        ),
                        Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width/3,
                          child: Icon(Icons.arrow_upward, color: Colors.black, size: 5 * SizeConfig.textMultiplier,),
                        ),Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width/3,
                          child: Icon(Icons.arrow_upward, color: Colors.black, size: 5 * SizeConfig.textMultiplier,),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                              color: ColorPalette.PrimaryColor,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Image.asset('res/images/PngItem_5112270.png'),
                                ),
                              )
                          ),
                        ), Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                              color: Colors.green,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                            child: Text(
                              'L-11',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2 * SizeConfig.textMultiplier
                              ),
                            ),
                          ),
                        ), Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                              color: ColorPalette.PrimaryColor,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Image.asset('res/images/PngItem_5112270.png'),
                                ),
                              )
                          ),
                        ),  Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                              color: ColorPalette.PrimaryColor,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Image.asset('res/images/PngItem_5112270.png'),
                                ),
                              )
                          ),
                        ),  Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                              color: ColorPalette.PrimaryColor,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Image.asset('res/images/PngItem_5112270.png'),
                                ),
                              )
                          ),
                        ),  Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                              color: ColorPalette.PrimaryColor,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Image.asset('res/images/PngItem_5112270.png'),
                                ),
                              )
                          ),
                        ), Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                              color: Colors.green,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                            child: Text(
                              'L-16',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2 * SizeConfig.textMultiplier
                              ),
                            ),
                          ),
                        ), Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                              color: Colors.green,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                            child: Text(
                              'L-17',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2 * SizeConfig.textMultiplier
                              ),
                            ),
                          ),
                        ), Container(
                          height: 10 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width/3,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                              color: Colors.green,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(
                            child: Text(
                              'L-18',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2 * SizeConfig.textMultiplier
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
