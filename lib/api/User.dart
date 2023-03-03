// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.userName,
    this.phone,
    this.address,
    this.city,
    this.dob,
    this.isFavorite,
    this.gender,
    this.id,
  });

  String? userName;
  String? phone;
  String? address;
  String? city;
  String? dob;
  String? isFavorite;
  String? gender;
  String? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userName: json["UserName"],
    phone: json["Phone"],
    address: json["Address"],
    city: json["City"],
    dob: json["DOB"],
    isFavorite: json["IsFavorite"].toString(),
    gender: json["Gender"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "UserName": userName,
    "Phone": phone,
    "Address": address,
    "City": city,
    "DOB": dob,
    "IsFavorite": isFavorite,
    "Gender": gender,
    "id": id,
  };
}
