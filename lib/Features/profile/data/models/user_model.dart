class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String image;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.image,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'image': image,
    };
  }
}
