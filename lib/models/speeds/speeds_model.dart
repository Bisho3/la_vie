class SpeedsModel {
  String? type;
  String? message;
  List<Data>? data;

  SpeedsModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  Data.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }
}
