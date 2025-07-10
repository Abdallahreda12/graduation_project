class ViewUserModel {
  int userId;
  String firstName;
  String lastName;
  String? photoUrl;
  String gender;
  String dateOfBirth;
  String? fullAddress;
  String location;
  int radius;
  String email;
  String password;
  int verifyCode;
  int approve;
  String createdAt;
  String updatedAt;
  String phone;
  int type;

  ViewUserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.photoUrl,
    required this.gender,
    required this.dateOfBirth,
    required this.fullAddress,
    required this.location,
    required this.radius,
    required this.email,
    required this.password,
    required this.verifyCode,
    required this.approve,
    required this.createdAt,
    required this.updatedAt,
    required this.phone,
    required this.type,
  });

  factory ViewUserModel.fromJson(Map<String, dynamic> json) {
    return ViewUserModel(
      userId: json['user_id'],
      firstName: json['users_first_name'],
      lastName: json['users_last_name'],
      photoUrl: json['users_photo_url'],
      gender: json['users_gender'],
      dateOfBirth: json['users_date_of_birth'],
      fullAddress: json['users_full_address'],
      location: json['users_location'],
      radius: json['users_radius'],
      email: json['users_email'],
      password: json['users_password'],
      verifyCode: json['users_verifycode'],
      approve: json['users_approve'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      phone: json['users_phone'],
      type: json['users_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'users_first_name': firstName,
      'users_last_name': lastName,
      'users_photo_url': photoUrl,
      'users_gender': gender,
      'users_date_of_birth': dateOfBirth,
      'users_full_address': fullAddress,
      'users_location': location,
      'users_radius': radius,
      'users_email': email,
      'users_password': password,
      'users_verifycode': verifyCode,
      'users_approve': approve,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'users_phone': phone,
      'users_type': type,
    };
  }
}
