class DoctorInfoModel {
  String? firstName;
  String? lastName;
  String? gender;
  String? emailAddress;
  String? phoneNumber;
  String? birthday;
  String? specialization;
  String? degrees;
  String? licensing;
  String? yearsExperience;
  String? clinicName;
  String? clinicAddress;
  String? turnOnNotification;
  String? location;
  String? homeVisits;

  DoctorInfoModel({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.emailAddress,
    required this.phoneNumber,
    required this.birthday,
    required this.specialization,
    required this.degrees,
    required this.licensing,
    required this.yearsExperience,
    required this.clinicName,
    required this.clinicAddress,
    required this.turnOnNotification,
    required this.location,
    required this.homeVisits,
  });

  factory DoctorInfoModel.fromJson(Map<String, dynamic> json) {
    return DoctorInfoModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      emailAddress: json['email_address'],
      phoneNumber: json['phone_number'],
      birthday: json['birthday'],
      specialization: json['specialization'],
      degrees: json['degrees'],
      licensing: json['licensing'],
      yearsExperience: json['years_experience'],
      clinicName: json['clinic_name'],
      clinicAddress: json['clinic_address'],
      turnOnNotification: json['turn_on_notification'],
      location: json['location'],
      homeVisits: json['home_visits'],
    );
  }
}
