class RegisterModel {
  late String type;
  late String message;
  late UserData data;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = (json['data'] != null ? UserData.fromJson(json['data']) : null)!;
  }
}

class UserData {
  User? user;
  String? accessToken;
  String? refreshToken;

  UserData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}

class User {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;

  // User(
  //     {this.userId,
  //     this.firstName,
  //     this.lastName,
  //     this.email,
  //     this.imageUrl,
  //     this.address,
  //     this.role});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
  }
}
