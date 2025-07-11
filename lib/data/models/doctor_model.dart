
class DoctorModel {
  final int doctorId;
  final int doctorsUserId;
  final String doctorsSpecialization;
  final String doctorsDegree;
  final int doctorsYearsExperience;
  final int doctorsHomeVisit;
  final String usersFirstName;
  final String usersPhotoUrl;
  final String usersLastName;
  final String phone;
  final String usersEmail;
  final String about ;
  final String loaction ;
  final double averageRating;
  final int ratingCount;

  DoctorModel( {
    required this.about ,
    required this.doctorId,
    required this.doctorsUserId,
    required this.doctorsSpecialization,
    required this.doctorsDegree,
    required this.doctorsYearsExperience,
    required this.doctorsHomeVisit,
    required this.usersFirstName,
    required this.usersPhotoUrl,
    required this.phone ,
    required this.usersLastName,
    required this.usersEmail,
    required this.averageRating,
    required this.loaction,
    required this.ratingCount,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      doctorId: json['doctor_id'] ?? 0,
      doctorsUserId: json['doctors_user_id'] ?? 0,
      doctorsSpecialization: json['doctors_specialization'] ?? '',
      doctorsDegree: json['doctors_degree'] ?? '',
      doctorsYearsExperience: json['doctors_years_experience'] ?? 0,
      doctorsHomeVisit: json['doctors_home_visit'] ?? 0,
      usersFirstName: json['users_first_name'] ?? '',
      usersPhotoUrl: json['users_photo_url'] ?? '',
      usersLastName: json['users_last_name'] ?? '',
      usersEmail: json['users_email'] ?? '',
      phone:   json["users_phone"],
      about: json['doctors_licensing_info'] ?? '',
      loaction: json['users_location'] ?? '',
      averageRating: double.parse(json['average_rating']),
      ratingCount: json['rating_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctor_id': doctorId,
      'doctors_user_id': doctorsUserId,
      'doctors_specialization': doctorsSpecialization,
      'doctors_degree': doctorsDegree,
      'doctors_years_experience': doctorsYearsExperience,
      'doctors_home_visit': doctorsHomeVisit,
      'users_first_name': usersFirstName,
      'users_photo_url': usersPhotoUrl,
      'users_last_name': usersLastName,
      'users_email': usersEmail,
      'average_rating': averageRating,
      'rating_count': ratingCount,
    };
  }

  // Helper getter for full name
  String get fullName => '$usersFirstName $usersLastName';
  
  
  // Helper getter to check if home visit is available
  bool get isHomeVisitAvailable => doctorsHomeVisit == 1;
}