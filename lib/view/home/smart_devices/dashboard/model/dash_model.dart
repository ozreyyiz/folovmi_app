class DashboardDataModel {
  DashboardDataModel({
    required this.distance,
    required this.calories,
    required this.lux,
    required this.temperature,
    required this.humidityModel,
    required this.particulateMatterModel,
  });
  late final double distance;
  late final double calories;
  late final Lux lux;
  late final Temperature temperature;
  late final HumidityModel humidityModel;
  late final ParticulateMatterModel particulateMatterModel;
  
  DashboardDataModel.fromJson(Map<String, dynamic> json){
    distance = json['distance'];
    calories = json['calories'];
    lux = Lux.fromJson(json['lux']);
    temperature = Temperature.fromJson(json['temperature']);
    humidityModel = HumidityModel.fromJson(json['humidityModel']);
    particulateMatterModel = ParticulateMatterModel.fromJson(json['particulateMatterModel']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['distance'] = distance;
    _data['calories'] = calories;
    _data['lux'] = lux.toJson();
    _data['temperature'] = temperature.toJson();
    _data['humidityModel'] = humidityModel.toJson();
    _data['particulateMatterModel'] = particulateMatterModel.toJson();
    return _data;
  }
}

class Lux {
  Lux({
    required this.id,
    required this.messageId,
    required this.deviceName,
    required this.topic,
    required this.value,
    required this.messageTime,
  });
  late final String? id;
  late final String? messageId;
  late final String? deviceName;
  late final String? topic;
  late final double? value;
  late final String? messageTime;
  
  Lux.fromJson(Map<String, dynamic> json){
    id = json['id'];
    messageId = json['messageId'];
    deviceName = json['deviceName'];
    topic = json['topic'];
    value = json['value'];
    messageTime = json['messageTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['messageId'] = messageId;
    _data['deviceName'] = deviceName;
    _data['topic'] = topic;
    _data['value'] = value;
    _data['messageTime'] = messageTime;
    return _data;
  }
}

class Temperature {
  Temperature({
    required this.id,
    required this.messageId,
    required this.deviceName,
    required this.topic,
    required this.value,
    required this.messageTime,
  });
  late final String? id;
  late final String? messageId;
  late final String? deviceName;
  late final String? topic;
  late final double? value;
  late final String? messageTime;
  
  Temperature.fromJson(Map<String, dynamic> json){
    id = json['id'];
    messageId = json['messageId'];
    deviceName = json['deviceName'];
    topic = json['topic'];
    value = json['value'];
    messageTime = json['messageTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['messageId'] = messageId;
    _data['deviceName'] = deviceName;
    _data['topic'] = topic;
    _data['value'] = value;
    _data['messageTime'] = messageTime;
    return _data;
  }
}

class HumidityModel {
  HumidityModel({
    required this.id,
    required this.messageId,
    required this.deviceName,
    required this.topic,
    required this.value,
    required this.messageTime,
  });
  late final String? id;
  late final String? messageId;
  late final String? deviceName;
  late final String? topic;
  late final double? value;
  late final String? messageTime;
  
  HumidityModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    messageId = json['messageId'];
    deviceName = json['deviceName'];
    topic = json['topic'];
    value = json['value'];
    messageTime = json['messageTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['messageId'] = messageId;
    _data['deviceName'] = deviceName;
    _data['topic'] = topic;
    _data['value'] = value;
    _data['messageTime'] = messageTime;
    return _data;
  }
}

class ParticulateMatterModel {
  ParticulateMatterModel({
    required this.id,
    required this.messageId,
    required this.deviceName,
    required this.topic,
    required this.pm25Value,
    required this.pm10Value,
    required this.messageTime,
  });
  late final String? id;
  late final String? messageId;
  late final String? deviceName;
  late final String? topic;
  late final String? pm25Value;
  late final String? pm10Value;
  late final String? messageTime;
  
  ParticulateMatterModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    messageId = json['messageId'];
    deviceName = json['deviceName'];
    topic = json['topic'];
    pm25Value = json['pm25Value'];
    pm10Value = json['pm10Value'];
    messageTime = json['messageTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['messageId'] = messageId;
    _data['deviceName'] = deviceName;
    _data['topic'] = topic;
    _data['pm25Value'] = pm25Value;
    _data['pm10Value'] = pm10Value;
    _data['messageTime'] = messageTime;
    return _data;
  }
}