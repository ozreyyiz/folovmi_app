class LoginModel{
  String? token;
  int? statusCode;
  dynamic body;

LoginModel({this.body,this.statusCode,this.token,});

LoginModel.fromJson(Map<String,dynamic>json){
  token=json["token"]?.toString();
  statusCode=json["Code"];
  body=json["body"]?.toString();
}
Map<String,dynamic>toJson(){
  final data =<String, dynamic>{};
  data["token"]=token;
  data["Code"]=statusCode;
  data["body"]=body;

return data;
}
}