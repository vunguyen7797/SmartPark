import 'package:capstone_parking_lot/components/custom_fade_in.dart';
import 'package:capstone_parking_lot/helper/constants.dart';
import 'package:capstone_parking_lot/helper/size_config.dart';
import 'package:capstone_parking_lot/ui/parking_lot_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key key,
  }) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    /// Show splash screen for 2 seconds
    Future.delayed(
      Duration(seconds: 2),
      () async {
        // final AuthenticateBloc signInBloc =
        // Provider.of<AuthenticateBloc>(context);
        // // Verify if user is logged in or not
        // signInBloc.isLoggedIn();
        // // If logged in -> Dashboard, otherwise -> Login Page
        // Navigator.pushReplacement(
        //     context,
        //     PageRouteBuilder(
        //         pageBuilder: (_, __, ___) => signInBloc.isSignedIn == false
        //             ? LoginPage()
        //             : CustomFadeIn(
        //             transform: false,
        //             transformDuration: 0,
        //             delay: 0,
        //             child: DashboardPage())));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String plName = prefs.getString('plName');
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => CustomFadeIn(
                    transform: false,
                    transformDuration: 0,
                    delay: 0,
                    child: plName == null || plName == "" ? ParkingLotPage() : DashboardPage(plName: plName, ))));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            ColorPalette.PrimaryColor,
            ColorPalette.SecondaryColor
          ], //ColorPalette.PrimaryColor, ColorPalette.SecondaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: CustomFadeIn(
          transform: false,
          delay: 0.0,
          opacityDuration: 800,
          transformDuration: 100,
          child: Center(
            child: Container(
                child: Text(
              'Smart Park',
              style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 3 * SizeConfig.textMultiplier),
            )),
          ),
        ),
      ),
    );
  }
}
