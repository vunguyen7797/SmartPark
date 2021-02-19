import 'package:capstone_parking_lot/helper/constants.dart';
import 'package:flutter/material.dart';

import '../helper/size_config.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final obscureTextMode;
  final keyboardType;
  final showPassword;
  final onTapShowPassword;
  final suffixIconController;
  final color;
  final height;
  final textFieldRadius;
  final padding;
  final horizontalPadding;
  final textAlign;
  final inputEnableController;
  const CustomTextField(
      {Key key,
      this.height,
      this.textAlign,
      this.inputEnableController,
      this.showPassword,
      this.onTapShowPassword,
      this.suffixIconController,
      this.hintText,
      this.textFieldRadius,
      this.controller,
      this.obscureTextMode,
      this.horizontalPadding,
      this.padding,
      this.color,
      this.keyboardType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 1.25 * SizeConfig.heightMultiplier),
      child: Container(
        height: height ?? 8 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(
              textFieldRadius ?? 3 * SizeConfig.heightMultiplier),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: horizontalPadding ?? 7 * SizeConfig.widthMultiplier,
            right: horizontalPadding ?? 5 * SizeConfig.widthMultiplier,
          ),
          child: Align(
            alignment: Alignment.center,
            child: TextFormField(
              enabled: inputEnableController ?? true,
              controller: controller,
              textAlign: textAlign ?? TextAlign.left,
              keyboardType: keyboardType,
              textInputAction: TextInputAction.done,
              obscureText: showPassword == true && obscureTextMode == true
                  ? true
                  : false,
              style: CustomizedTextStyle.kTextFieldTextStyle,
              cursorColor: Colors.black26,
              decoration: InputDecoration(
                suffixIcon: obscureTextMode == true
                    ? GestureDetector(
                        onTap: onTapShowPassword,
                        child: suffixIconController,
                      )
                    : null,
                border: InputBorder.none,
                hintText: hintText,
                alignLabelWithHint: true,
                hintStyle: CustomizedTextStyle.kHintTextFieldTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
