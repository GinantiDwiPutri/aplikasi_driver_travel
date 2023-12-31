class DriverModel {
  DriverModel({
    this.uid,
    this.phoneNumber,
    this.displayName,
    this.email,
    this.emailVerifiedAt,
    this.photoURL,
    this.creationTime,
    this.lastSignInTime,
    this.updatedTime,
    this.status,
    this.carType,
    this.carNumber,
  });

  String? uid;
  String? phoneNumber;
  String? displayName;
  String? email;
  String? emailVerifiedAt;
  String? photoURL;
  String? creationTime;
  String? lastSignInTime;
  String? updatedTime;
  String? status;
  String? carType;
  String? carNumber;

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
        uid: json["uid"],
        phoneNumber: json["phoneNumber"],
        displayName: json["displayName"],
        email: json["email"],
        emailVerifiedAt: json["emailVerifiedAt"],
        photoURL: json["photoURL"],
        creationTime: json["creationTime"],
        lastSignInTime: json["lastSignInTime"],
        updatedTime: json["updatedTime"],
        status: json["status"],
        carType: json["carType"],
        carNumber: json["carNumber"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "phoneNumber": phoneNumber,
        "displayName": displayName,
        "email": email,
        "emailVerifiedAt": emailVerifiedAt,
        "photoURL": photoURL,
        "creationTime": creationTime,
        "lastSignInTime": lastSignInTime,
        "updatedTime": updatedTime,
        "status": status,
        "carType": carType,
        "carNumber": carNumber,
      };
}
