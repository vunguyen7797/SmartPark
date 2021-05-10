import 'package:capstone_parking_lot/blocs/user_bloc.dart';
import 'package:capstone_parking_lot/helper/constants.dart';
import 'package:capstone_parking_lot/helper/size_config.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



class ReservePage extends StatefulWidget {
  @override
  _ReservePageState createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),() async {

      final ub = Provider.of<UserBloc>(context);
     ub.getReservedList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 7 * SizeConfig.widthMultiplier,
                vertical: 2 * SizeConfig.heightMultiplier),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1 * SizeConfig.heightMultiplier,
                ),
                GestureDetector(
                  onTap: () async{
                      Navigator.pop(context);
                  },
                  child: Icon(FlevaIcons.arrow_ios_back, size: 3 * SizeConfig.textMultiplier, color: Colors.black,),
                ),
                SizedBox(
                  height: 4* SizeConfig.heightMultiplier,
                ),
                Container(
                  child: Center(
                    child: Text('My Reserved Spaces',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.PrimaryColor,
                          fontSize:5 * SizeConfig.textMultiplier,
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: _buildReservedList(context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildReservedList(context) {
    final ub = Provider.of<UserBloc>(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 50, left: 20, right: 20, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 1 * SizeConfig.heightMultiplier,
          ),
          Expanded(
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child:ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: ub.reservedList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1 * SizeConfig.heightMultiplier),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),

                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.5 * SizeConfig.widthMultiplier),
                            child: Stack(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child:  Text(
                                            'Slot ${ub.reservedList[index]}',
                                            style: GoogleFonts.rubik(
                                                color: Colors.black,
                                                fontSize: 2 * SizeConfig.textMultiplier,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                              Positioned(
                                  right: 0,
                                  top: -15,
                                  child:     IconButton(icon: Icon(
                                FlevaIcons.close,
                                color: ColorPalette.PrimaryColor,
                              ), onPressed: (){
                                    final ub = Provider.of<UserBloc>(context);
                                    ub.removeFromReservedList(ub.reservedList[index]);

                                  })),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
            ),
          ),
        ],
      ),
    );
  }
}
