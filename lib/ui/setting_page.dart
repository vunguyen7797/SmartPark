import 'package:capstone_parking_lot/blocs/auth_bloc.dart';
import 'package:capstone_parking_lot/blocs/user_bloc.dart';
import 'package:capstone_parking_lot/helper/constants.dart';
import 'package:capstone_parking_lot/helper/size_config.dart';
import 'package:capstone_parking_lot/ui/login_page.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String _name = 'Login';

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 0), () {
      final authBloc = Provider.of<AuthBloc>(context);
      final userBloc = Provider.of<UserBloc>(context);
      if (authBloc.isSignedIn || userBloc.name != null) {
        setState(() {
          _name = userBloc.email ?? 'Set name';
        });
      } else
        print('Setting page build ${userBloc.name}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = Provider.of<UserBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 5 * SizeConfig.widthMultiplier,
                vertical: 5 * SizeConfig.heightMultiplier),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildActionBar(context),
                SizedBox(
                  height: 3 * SizeConfig.heightMultiplier,
                ),
                Container(
                  child: Text(
                    'Settings',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.rubik(
                        color: ColorPalette.PrimaryColor,
                        fontSize: 4 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 3 * SizeConfig.heightMultiplier,
                ),
                ListTile(
                  onTap: () {
                    final authBloc = Provider.of<AuthBloc>(context);
                    if (!authBloc.isSignedIn || userBloc.uid == "" || userBloc.uid == null)
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                    ),
                    child: Icon(
                      FlevaIcons.person,
                      color: Colors.white,
                      size: 2 * SizeConfig.textMultiplier,
                    ),
                  ),
                  title: Text(
                    _name,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 2 * SizeConfig.textMultiplier),
                  ),
                  trailing: Icon(
                    FlevaIcons.arrow_ios_forward,
                    color: Colors.black,
                    size: 3 * SizeConfig.textMultiplier,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildActionBar(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          FlevaIcons.bell_outline,
          color: Colors.transparent,
          size: 4 * SizeConfig.textMultiplier,
        ),
        GestureDetector(
          onTap: () async {
            final authBloc = Provider.of<AuthBloc>(context);
            await authBloc.signOut().then((value) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            });
          },
          child: Icon(
            FlevaIcons.log_out,
            color: ColorPalette.PrimaryColor,
            size: 4 * SizeConfig.textMultiplier,
          ),
        )
      ],
    );
  }
}
