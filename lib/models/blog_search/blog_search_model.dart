class BlogsSearchModel {
  String? type;
  String? message;
  Data? data;

  BlogsSearchModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  // Data(
  //     {this.plantId,
  //       this.name,
  //       this.description,
  //       this.imageUrl,
  //       this.waterCapacity,
  //       this.sunLight,
  //       this.temperature});

  Data.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }
}
