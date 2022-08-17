class SignUpModel {
  int? userId;
  String? name;
  String? lastName;
  String? gender;
  String? birthDate;
  int? weight;
  int? height;
  String? identityNumber;
  String? phoneNumber;
  String? email;
  String? registerDate;
  String? lastLoginDate;
  String? hashPass;
  int? statusCode;

  SignUpModel(
      {this.userId,
      this.name,
      this.lastName,
      this.gender,
      this.birthDate,
      this.weight,
      this.height,
      this.identityNumber,
      this.phoneNumber,
      this.email,
      this.registerDate,
      this.lastLoginDate,
      this.hashPass,
      this.statusCode});

      SignUpModel.fromJson(Map<String,dynamic>json){
        userId=json["userId"];
        name=json["name"]?.toString();
        lastName=json["lastName"]?.toString();
        gender=json["gender"]?.toString();
        birthDate=json["birthDate"]?.toString();
        weight=json["weight"];
        height=json["height"];
        identityNumber=json["identityNumber"]?.toString();
        phoneNumber=json["phoneNumber"]?.toString();
        email=json["email"]?.toString();
        registerDate=json["registerDate"]?.toString();
        lastLoginDate=json["lastLoginDate"]?.toString();
        hashPass=json["hashPass"]?.toString();
        statusCode=json["statusCode"];
      }


      Map<String,dynamic>toJson(){
        final data=<String,dynamic>{};
        data["userId"]=userId;
        data["name"]=name;
        data["lastName"]=lastName;
        data["gender"]=gender;
        data["birthDate"]=birthDate;
        data["weight"]=weight;
        data["height"]=height;
        data["identityNumber"]=identityNumber;
        data["phoneNumber"]=phoneNumber;
        data["email"]=email;
        data["registerDate"]=registerDate;
        data["lastLoginDate"]=lastLoginDate;
        data["hashPass"]=hashPass;
        data["statusCode"]=statusCode;
        return data;

      }
}
