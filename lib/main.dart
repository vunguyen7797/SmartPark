import 'package:capstone_parking_lot/helper/services.dart';
import 'package:capstone_parking_lot/ui/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/auth_bloc.dart';
import 'blocs/user_bloc.dart';
import 'helper/constants.dart';
import 'helper/size_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SmartParking());
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class SmartParking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        ChangeNotifierProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
        ChangeNotifierProvider<ParkingServiceBloc>(
          create: (context) => ParkingServiceBloc(),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                  builder: (context, child) {
                    return ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: child,
                    );
                  },
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData.dark().copyWith(
                    primaryColor: ColorPalette.SecondaryColor,
                    accentColor: Colors.transparent,
                    dialogTheme: DialogTheme.of(context).copyWith(
                        backgroundColor: Colors.grey,
                        contentTextStyle:
                            TextStyle(color: ColorPalette.kLightBlack)),
                    textSelectionColor: ColorPalette.SecondaryColor,
                    scaffoldBackgroundColor: Colors.white,
                  ),
                  home: SplashPage()
                  // initialRoute: '/',
                  // routes: {
                  //   '/': (context) => SplashPage(),
                  // },
                  );
            },
          );
        },
      ),
    );
  }
}
