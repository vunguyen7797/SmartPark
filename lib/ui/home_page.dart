import 'package:cached_network_image/cached_network_image.dart';
import 'package:capstone_parking_lot/blocs/user_bloc.dart';
import 'package:capstone_parking_lot/helper/constants.dart';
import 'package:capstone_parking_lot/helper/services.dart';
import 'package:capstone_parking_lot/helper/size_config.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),(){
      var service = ParkingServiceBloc();
      service.getParkingInfo();
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final userBloc = Provider.of<UserBloc>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: ColorPalette.PrimaryColor,
              ),
            ),
            Positioned(
                top: 7 * SizeConfig.heightMultiplier,
                left: 5 * SizeConfig.widthMultiplier,
                right: 5 * SizeConfig.widthMultiplier,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    userBloc.photoUrl == null
                        ? Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              FlevaIcons.person,
                              color: Colors.black,
                            ),
                          )
                        : CachedNetworkImage(
                            imageUrl: userBloc.photoUrl,
                            imageBuilder: (context, imageProvider) => ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      2 * SizeConfig.heightMultiplier),
                                  bottomRight: Radius.circular(
                                      2 * SizeConfig.heightMultiplier)),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(
                                FlevaIcons.person,
                                color: Colors.black,
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(
                                FlevaIcons.person,
                                color: Colors.black,
                              ),
                            ),
                          ),
                    SizedBox(
                      width: 3 * SizeConfig.widthMultiplier,
                    ),
                    Icon(
                      FlevaIcons.pin,
                      size: 2 * SizeConfig.textMultiplier,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 2 * SizeConfig.widthMultiplier,
                    ),
                    Text(
                      'Arkansas State University Library',
                      style: GoogleFonts.rubik(),
                    ),
                  ],
                )),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 17 * SizeConfig.heightMultiplier,
                    left: 5 * SizeConfig.widthMultiplier,
                    right: 5 * SizeConfig.widthMultiplier),
                child: Container(
                  width: double.infinity,
                  height: 5 * SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FlevaIcons.search,
                          color: ColorPalette.PrimaryColor,
                        ),
                        SizedBox(
                          width: 5 * SizeConfig.widthMultiplier,
                        ),
                        Text(
                          'Search spaces',
                          style: TextStyle(
                            fontSize: 1.75 * SizeConfig.textMultiplier,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
                child: _buildAvailableParkingSpaceList(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildAvailableParkingSpaceList(context) {
    final pb = Provider.of<ParkingServiceBloc>(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 50, left: 20, right: 20, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Parking Spaces',
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontSize: 2.5 * SizeConfig.textMultiplier,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 1 * SizeConfig.heightMultiplier,
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: pb.parkingSpaces.length,
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Slot ${pb.parkingSpaces[index].name}',
                                    style: GoogleFonts.rubik(
                                        color: Colors.black,
                                        fontSize: 2 * SizeConfig.textMultiplier,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${pb.parkingSpaces[index].location}',
                                    style: GoogleFonts.rubik(
                                      color: Colors.grey,
                                      fontSize: 1.5 * SizeConfig.textMultiplier,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    pb.parkingSpaces[index].status ? 'AVAILABLE' : 'OCCUPIED',
                                    style: GoogleFonts.rubik(
                                      color:   pb.parkingSpaces[index].status ? Colors.green : ColorPalette.PrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 2.5 * SizeConfig.textMultiplier,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 9 * SizeConfig.widthMultiplier,
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          2 * SizeConfig.heightMultiplier),
                                  decoration: BoxDecoration(
                                      color: ColorPalette.PrimaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    pb.parkingSpaces[index].reservedStatus ? 'Reserved' : 'Reserve Now',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.rubik(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          1.75 * SizeConfig.textMultiplier,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
