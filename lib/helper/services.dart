import 'dart:convert';

import 'package:capstone_parking_lot/models/spaceModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class ParkingServiceBloc with ChangeNotifier{

  List<ParkingSpace> _parkingSpaces =[];
   List<ParkingSpace> get parkingSpaces => _parkingSpaces;
  set  parkingSpaces(newVal) => _parkingSpaces = newVal;



  Future<void> getParkingInfo(plId) async {
    var client = http.Client();
    var url = 'http://localhost:8080/data';
    _parkingSpaces.clear();
    var response = await client.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    for (var item in json.decode(response.body) )
      {
        _parkingSpaces.add(ParkingSpace.fromMap(item));
      }

    client.close();

    notifyListeners();
  }
}