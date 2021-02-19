class ParkingSpace {
  String name;
  String location;
  bool status;
  bool reservedStatus;

  ParkingSpace({this.name, this.location, this.status, this.reservedStatus});


  factory ParkingSpace.fromMap(Map<String, dynamic> data){
    return ParkingSpace(
      name: data['Name'],
      location: data['Location'],
      status: data['Status'] == "True" ? true : false,
      reservedStatus: data['Reserve_status']== "True" ? true : false
    );
  }

}