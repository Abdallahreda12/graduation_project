class UserModel {
  int userId;
  String? usersFirstName;
  String? usersLastName;
  String? usersPhotoUrl;
  String? usersGender;
  String? usersDateOfBirth;
  String? usersFullAddress;
  String? usersLocation;
  dynamic usersRadius;
  String? usersEmail;
  String? usersPassword;
  int? usersVerifyCode;
  int? usersApprove;
  String? createdAt;
  String? updatedAt;
  String? usersPhone;

  UserModel({
    required this.userId,
    this.usersFirstName,
    this.usersLastName,
    this.usersPhotoUrl,
    this.usersGender,
    this.usersDateOfBirth,
    this.usersFullAddress,
    this.usersLocation,
    this.usersRadius,
    this.usersPhone,
    required this.usersEmail,
    required this.usersPassword,
    required this.usersVerifyCode,
    required this.usersApprove,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      usersFirstName: json['users_first_name'],
      usersLastName: json['users_last_name'],
      usersPhotoUrl: json['users_photo_url'],
      usersGender: json['users_gender'],
      usersDateOfBirth: json['users_date_of_birth'],
      usersFullAddress: json['users_full_address'],
      usersLocation: json['users_location'],
      usersRadius: json['users_radius'],
      usersEmail: json['users_email'],
      usersPassword: json['users_password'],
      usersVerifyCode: json['users_verifycode'],
      usersApprove: json['users_approve'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      usersPhone: json['users_phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'users_first_name': usersFirstName,
      'users_last_name': usersLastName,
      'users_photo_url': usersPhotoUrl,
      'users_gender': usersGender,
      'users_date_of_birth': usersDateOfBirth,
      'users_full_address': usersFullAddress,
      'users_location': usersLocation,
      'users_radius': usersRadius,
      'users_email': usersEmail,
      'users_password': usersPassword,
      'users_verifycode': usersVerifyCode,
      'users_approve': usersApprove,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'users_phone': usersPhone
    };
  }
}
