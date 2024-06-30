// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;
  String? refreshToken;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.token,
    required this.refreshToken,
  });

  factory UserModel.fromJSON(Map<String, dynamic> loginJSON) {
    return UserModel(
      id: loginJSON['id'],
      username: loginJSON['username'],
      email: loginJSON['email'],
      firstName: loginJSON['firstName'],
      lastName: loginJSON['lastName'],
      gender: loginJSON['gender'],
      image: loginJSON['image'],
      token: loginJSON['token'],
      refreshToken: loginJSON['refreshToken'],
    );
  }
}
