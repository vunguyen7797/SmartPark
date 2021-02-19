import 'package:capstone_parking_lot/helper/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorPalette {
  static const PrimaryColor = Color(0xffcc092f);
  static const SecondaryColor = Color(0xffA80067);

  static const LockModeColor = Color(0xffd32f2f);
  static const InnerColor = Colors.white;
  static const SuccessColor = Color(0xff009D64);

  static const kGradientTextColor = Color.fromRGBO(126, 26, 135, 50);
  static const kPrimaryForGradientColor = Color.fromRGBO(126, 26, 135, 50);
  static const kSecondaryForGradientColor = Color.fromRGBO(88, 178, 229, 1);
  static const kLightBlack = Color(0xff162843);
  static const kScaffoldColor = Color(0xffF5F9FF);
}

class CustomizedTextStyle {
  static final kTextFieldTextStyle = TextStyle(
    color: CupertinoColors.black,
    fontSize: 2 * SizeConfig.textMultiplier, // == size 17

    fontWeight: FontWeight.w500,
  );

  static final kHintTextFieldTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 2 * SizeConfig.textMultiplier,
  );

  static final kSubtitleLightSmallTextStyle = GoogleFonts.rubik(
    color: ColorPalette.PrimaryColor.withOpacity(0.6),
    fontSize: 1.75 * SizeConfig.textMultiplier,
  );
}
