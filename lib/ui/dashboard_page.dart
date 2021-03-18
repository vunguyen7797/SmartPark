import 'dart:io';

import 'package:capstone_parking_lot/blocs/user_bloc.dart';
import 'package:capstone_parking_lot/components/custom_bottom_bar.dart';
import 'package:capstone_parking_lot/helper/constants.dart';
import 'package:capstone_parking_lot/helper/size_config.dart';
import 'package:capstone_parking_lot/ui/home_page.dart';
import 'package:capstone_parking_lot/ui/setting_page.dart';
import 'package:device_info/device_info.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mapview_page.dart';

class DashboardPage extends StatefulWidget {
  final plName;
  final plId;

  const DashboardPage({Key key, this.plName, this.plId}) : super(key: key);
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String _deviceInfo = "";

   List<Widget> _childrenPages;

  @override
  void initState() {
    _childrenPages = [HomePage(plName: widget.plName, plId: widget.plId), MapViewPage(), SettingPage()];
    Future.delayed(Duration(milliseconds: 0), () async {
      final userBloc = Provider.of<UserBloc>(context);
      userBloc.getUserFirestore();

      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        _deviceInfo = androidInfo.manufacturer;
      } else {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        _deviceInfo = iosInfo.name;
        print('Running on $_deviceInfo');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _childrenPages[_currentIndex],
      bottomNavigationBar: CustomBottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        backgroundColor: Colors.white,
        selectedIndex: _currentIndex,
        animationDuration: Duration(milliseconds: 0),
        enableAnimation: false,
        showElevation: true,
        onItemSelected: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
        // containerHeight:
        //     (Platform.isAndroid ? 6.5 : 9) * SizeConfig.heightMultiplier,
        containerHeight: Platform.isAndroid
            ? MediaQuery.of(context).size.height * 0.075
            : _deviceInfo.contains(new RegExp(r'[5-8]')) ||
                    _deviceInfo.contains('SE')
                ? MediaQuery.of(context).size.height * 0.075
                : MediaQuery.of(context).size.height * 0.09,
        items: [
          BottomNavyBarCustomItem(
            inactiveColor: Colors.grey,
            icon: Icon(FlevaIcons.home_outline,
                size: 3.5 * SizeConfig.textMultiplier),
            activeColor:
                ColorPalette.PrimaryColor, //ColorPalette.SecondaryColor,
          ),
          BottomNavyBarCustomItem(
            inactiveColor: Colors.grey,
            icon: Icon(FlevaIcons.map_outline,
                size: 3.5 * SizeConfig.textMultiplier),
            activeColor:
            ColorPalette.PrimaryColor, //ColorPalette.SecondaryColor,
          ),
          BottomNavyBarCustomItem(
            inactiveColor: Colors.grey,
            icon: Icon(FlevaIcons.person_outline,
                size: 3.5 * SizeConfig.textMultiplier),
            activeColor:
                ColorPalette.PrimaryColor, //ColorPalette.SecondaryColor,
          ),
        ],
      ),
    );
  }
}
