class ParkingSpace {
  String name;
  String location;
  bool status;
  bool reservedStatus;

  ParkingSpace({this.name, this.location, this.status, this.reservedStatus});


  factory ParkingSpace.fromMap(Map<String, dynamic> data){
    return ParkingSpace(
      name: data['name'],
      location: data['location'],
      status: data['status'] == 1 ? true : false,
      reservedStatus: data['reserve_status']== 1 ? false : true
    );
  }

}