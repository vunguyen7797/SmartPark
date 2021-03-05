import 'package:capstone_parking_lot/blocs/auth_bloc.dart';
import 'package:capstone_parking_lot/components/custom_text_field.dart';
import 'package:capstone_parking_lot/helper/constants.dart';
import 'package:capstone_parking_lot/helper/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _resetEmailController = new TextEditingController();

  Icon _suffixIconController = Icon(FlevaIcons.eye_off, color: Colors.grey);

  bool _isNotSuccess = false;

  bool _isEmpty = false;

  bool _showPassword = true;
  bool _showSpinner = false;

  void _onTapShowPassword() {
    if (_showPassword == true)
      setState(() {
        _showPassword = false;
        _suffixIconController = Icon(FlevaIcons.eye, color: Colors.grey);
      });
    else {
      setState(() {
        _showPassword = true;
        _suffixIconController = Icon(FlevaIcons.eye_off, color: Colors.grey);
      });
    }
  }

  void _validateEmail() async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_resetEmailController.text);
    try {
      if (_resetEmailController.text != "" && emailValid) {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _resetEmailController.text)
            .then((value) {
          Navigator.pop(context);
        }).catchError(() {
          Navigator.pop(context);
        });
      } else {
        setState(() {
          _resetEmailController.text = "Email is not valid";
        });
      }
    } catch (e) {
      Navigator.pop(context);
      _resetEmailController.text = "";
    }
  }

  /// Sign-in using registered email and password
  void _signInWithEmailPassword() async {
    setState(() {
      _showSpinner = true;
    });

    if (_emailController.text != "" && _passwordController.text != "") {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      final AuthBloc signInBloc = Provider.of<AuthBloc>(context);
      await signInBloc
          .signInWithEmailAndPassword(
              _emailController.text, _passwordController.text)
          .then((_) {
        _updateUserDataLogin(signInBloc);
      });

      if (signInBloc.hasError) {
        setState(() {
          _isNotSuccess = true;
        });
      }
      setState(() {
        _showSpinner = false;
      });
    } else {
      setState(() {
        _showSpinner = false;
        _isNotSuccess = false;
        _isEmpty = true;
      });
    }
  }

  void _updateUserDataLogin(authBloc) {
    if (authBloc.hasError == true ||
        authBloc.uid == null ||
        authBloc.uid == "") {
      setState(() {
        _isNotSuccess = true;
      });
    } else {
      authBloc.userExistCheck().then((value) {
        if (authBloc.userExists) {
          authBloc.setUidToLocalStorage().then((value) => authBloc
              .setSignInStatus()
              .then((value) => Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => DashboardPage()))));
          if (mounted)
            setState(() {
              _showSpinner = false;
            });
        } else {
          setState(() {
            _showSpinner = false;
          });
          authBloc.setUidToLocalStorage().then((value) => authBloc
              .addUserToFirestoreDatabase()
              .then((value) => authBloc.setSignInStatus().then((value) =>
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => DashboardPage())))));
        }
      });
    }
    ;
  }

  void _signInWithSocialPlatform(BuildContext context, String init) async {
    setState(() {
      _showSpinner = true;
    });

    final AuthBloc signInBloc = Provider.of<AuthBloc>(context);

    switch (init) {
      case "GG":
        await signInBloc.signInWithGoogle(context).then((_) {
          _updateUserDataLogin(signInBloc);
        });
        break;
    }
    setState(() {
      _showSpinner = false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _resetEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          progressIndicator: SpinKitFadingFour(
            color: ColorPalette.PrimaryColor,
          ),
          inAsyncCall: _showSpinner,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 7 * SizeConfig.widthMultiplier,
                    vertical: 2 * SizeConfig.heightMultiplier),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7 * SizeConfig.heightMultiplier,
                    ),
                    Container(
                      child: Text('SmartParking',
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.bold,
                            color: ColorPalette.PrimaryColor,
                            fontSize: 5 * SizeConfig.textMultiplier,
                          )),
                    ),
                    Container(
                      child: Text('AI Powered Parking Assistant',
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w500,
                            color: CupertinoColors.black,
                            fontSize: 2.2 * SizeConfig.textMultiplier,
                          )),
                    ),
                    SizedBox(
                      height: 7 * SizeConfig.heightMultiplier,
                    ),
                    Center(
                      child: Text(
                        _isNotSuccess == true
                            ? 'Email or password is incorrect. Please try again.'
                            : _isEmpty == true
                                ? 'Please enter all required fields.'
                                : "",
                        style: CustomizedTextStyle.kSubtitleLightSmallTextStyle,
                      ),
                    ),
                    CustomTextField(
                        hintText: 'Email address',
                        controller: _emailController,
                        obscureTextMode: false),
                    CustomTextField(
                        showPassword: _showPassword,
                        onTapShowPassword: _onTapShowPassword,
                        suffixIconController: _suffixIconController,
                        hintText: 'Password',
                        controller: _passwordController,
                        obscureTextMode: true),
                    Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('Forgot password?',
                            style: GoogleFonts.rubik(
                              color: CupertinoColors.black,
                              fontSize: 1.75 * SizeConfig.textMultiplier,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 6 * SizeConfig.heightMultiplier,
                    ),
                    GestureDetector(
                      onTap: () {
                        _signInWithEmailPassword();
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorPalette.PrimaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 1.5 * SizeConfig.heightMultiplier,
                              horizontal: 8 * SizeConfig.widthMultiplier),
                          child: Text('SIGN IN',
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                color: CupertinoColors.white,
                                fontSize: 2.0 * SizeConfig.textMultiplier,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5 * SizeConfig.heightMultiplier,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 20 * SizeConfig.widthMultiplier,
                          child: Divider(
                            color: CupertinoColors.black.withOpacity(0.6),
                            thickness: 1,
                          ),
                        ),
                        Text(
                          'or connect with',
                          style: GoogleFonts.rubik(
                              fontSize: 1.75 * SizeConfig.textMultiplier,
                              color: CupertinoColors.black),
                        ),
                        SizedBox(
                          width: 20 * SizeConfig.widthMultiplier,
                          child: Divider(
                            color: CupertinoColors.black.withOpacity(0.6),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5 * SizeConfig.heightMultiplier,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _signInWithSocialPlatform(context, "GG");
                          },
                          child: Container(
                            child: Icon(
                              FlevaIcons.google_outline,
                              color: ColorPalette.PrimaryColor,
                              size: 8 * SizeConfig.textMultiplier,
                            ),
                          ),
                        ),
                        Container(
                          child: Icon(
                            FlevaIcons.facebook_outline,
                            color: ColorPalette.PrimaryColor,
                            size: 8 * SizeConfig.textMultiplier,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6 * SizeConfig.heightMultiplier,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                          text: TextSpan(
                              text: 'Don\'t have an SmartParking account? ',
                              style: GoogleFonts.rubik(
                                  fontSize: 1.75 * SizeConfig.textMultiplier,
                                  color: CupertinoColors.black),
                              children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 1.75 * SizeConfig.textMultiplier,
                                  color: ColorPalette.PrimaryColor),
                            )
                          ])),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
