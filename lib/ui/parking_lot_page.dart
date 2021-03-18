import 'package:capstone_parking_lot/helper/constants.dart';
import 'package:capstone_parking_lot/helper/size_config.dart';
import 'package:capstone_parking_lot/ui/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParkingLotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5 * SizeConfig.heightMultiplier,),
              Text('Select A Parking Lot',textAlign: TextAlign.center, style: GoogleFonts.rubik(
              color: ColorPalette.PrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 3 * SizeConfig.textMultiplier),
          ),
              SizedBox(height: 5 * SizeConfig.heightMultiplier,),
              GestureDetector(
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('plName', 'Arkansas State University Library');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DashboardPage(plName: 'Arkansas State University Library', plId: '1')));
                },
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5 * SizeConfig.widthMultiplier, vertical: 2.5 * SizeConfig.heightMultiplier),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorPalette.PrimaryColor,
                    ),
                    width: double.infinity,
                    height: 10 * SizeConfig.heightMultiplier,

                    child: Center(
                      child: Text('Arkansas State University Library',textAlign: TextAlign.center,style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 2 * SizeConfig.textMultiplier), ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5 * SizeConfig.widthMultiplier, vertical: 2.5 * SizeConfig.heightMultiplier),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorPalette.PrimaryColor,
                  ),
                  width: double.infinity,
                  height: 10 * SizeConfig.heightMultiplier,

                  child: Center(
                    child: Text('Arkansas Hall',textAlign: TextAlign.center,style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 2 * SizeConfig.textMultiplier), ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5 * SizeConfig.widthMultiplier, vertical: 2.5 * SizeConfig.heightMultiplier),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorPalette.PrimaryColor,
                  ),
                  width: double.infinity,
                  height: 10 * SizeConfig.heightMultiplier,

                  child: Center(
                    child: Text('North Park Quad Dorm',textAlign: TextAlign.center,style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 2 * SizeConfig.textMultiplier), ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
