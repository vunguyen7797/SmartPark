import 'dart:convert';
import 'dart:io';

import 'package:capstone_parking_lot/models/spaceModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class ParkingServiceBloc with ChangeNotifier{

  List<ParkingSpace> _parkingSpaces =[];
   List<ParkingSpace> get parkingSpaces => _parkingSpaces;
  set  parkingSpaces(newVal) => _parkingSpaces = newVal;

  List testData= [{
  'name': "A-1",
  'location': "Library",
  'status': 0,
  'reserve_status': 0
  },{
  'name': "A-2",
  'location': "Library",
  'status': 1,
  'reserve_status': 1
  },{
  'name': "B-6",
  'location': "Library",
  'status': 1,
  'reserve_status': 1
  },{
  'name': "B-13",
  'location': "Library",
  'status': 0,
  'reserve_status': 0
  },{
  'name': "C-4",
  'location': "Library",
  'status': 0,
  'reserve_status': 1
  },{
  'name': "C-5",
  'location': "Library",
  'status': 1,
  'reserve_status': 1
  },{
  'name': "D-1",
  'location': "Library",
  'status': 0,
  'reserve_status': 0
  },{
  'name': "D-3",
  'location': "Library",
  'status': 1,
  'reserve_status': 1
  },{
  'name': "D-4",
  'location': "Library",
  'status': 0,
  'reserve_status': 1
  },{
  'name': "D-11",
  'location': "Library",
  'status': 0,
  'reserve_status': 0
  }];



  main() async {


    var channel = IOWebSocketChannel.connect(Uri.parse('ws://localhost:8080/data'),  headers: {'Connection': 'upgrade', 'Upgrade': 'websocket'});
    print("Running web socket");
    channel.stream.listen((message) {
      print("Message here: " + message);

      for (var item in jsonDecode(message.body))
      {
        _parkingSpaces.add(ParkingSpace.fromMap(item));
      }
      print(_parkingSpaces.length);

      channel.sink.add('received!');
      channel.sink.close(status.goingAway);
    });
    print("Done web socket");

  }

  Future<void> getParkingInfo(plId) async {
   var client = http.Client();
   var url = 'http://localhost:8080/data';
    _parkingSpaces.clear();
   var response = await client.get(url);
   print('Response status: ${response.statusCode}');
   print('Response body: ${response.body}');
    
 
    for (var item in jsonDecode(response.body))
      {
        _parkingSpaces.add(ParkingSpace.fromMap(item));
      }
    print(_parkingSpaces.length);
    client.close();

    notifyListeners();
  }

  Future<void> updateReserveStatus(name, reserveStatus) async {
    var client = http.Client();
    var status = reserveStatus ? "1" : "0";
    var url = 'http://localhost:8080/updatereservestatus/$name/status/$status';

    var response = await client.post(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


    // for (var item in jsonDecode(response.body))
    // {
    //   _parkingSpaces.add(ParkingSpace.fromMap(item));
    // }
    // print(_parkingSpaces.length);
    client.close();

    notifyListeners();
  }
}