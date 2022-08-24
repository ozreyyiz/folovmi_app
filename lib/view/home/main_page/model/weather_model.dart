class Weather {
  String? cityName;
  double? temperature;
  int? humidity;
  String? country;
  String? weatherDescription;

Weather({this.cityName,this.temperature,this.humidity,this.country, this.weatherDescription});

Weather.fromJson(Map<String,dynamic> json){
  cityName=json["name"];
  temperature=json["main"]["temp"];
  humidity=json["main"]["humidity"];
  country=json["sys"]["country"];
  weatherDescription=json["visibilty"];
}
}
