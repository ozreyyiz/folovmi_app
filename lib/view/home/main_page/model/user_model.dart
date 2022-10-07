import 'dart:developer';

class UserModel {
  final int userId;
  final String name;
  final String lastname;
  final String gender;
  final String birthDate;
  final int weight;
  final int height;
  final String identityNumber;
  final String phoneNumber;
  final String email;
  final String registerDate;
  final String lastLoginDate;

  UserModel({
    required this.userId,
    required this.name,
    required this.lastname,
    required this.gender,
    required this.birthDate,
    required this.weight,
    required this.height,
    required this.identityNumber,
    required this.phoneNumber,
    required this.email,
    required this.registerDate,
    required this.lastLoginDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userId: json["userId"],
        name: json["name"],
        lastname: json["lastName"],
        gender: json["gender"],
        birthDate: json["birthDate"],
        weight: json["weight"],
        height: json["height"],
        identityNumber: json["identityNumber"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        registerDate: json["registerDate"],
        lastLoginDate: json["lastLoginDate"]);
  }


  Map<String,dynamic>tojson()=>{
"userId":userId,
"lastname":lastname,
"gender":gender,
"birthDate":birthDate,
"weight":weight,
"height":height,
"identityNumber":identityNumber,
"phoneNumber":phoneNumber,
"email":email,
"registerDate":registerDate,
"lastLoginDate":lastLoginDate,


  };
}
