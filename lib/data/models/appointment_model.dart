class AppointmentModel {
  final int bookingId;
  final String appointmentDate;
  final String appointmentTime;
  final String status;
  final int userId;
  final String userFirstName;
  final String userLastName;
  final String userEmail;
  final int sickId;
  final String animalOwnerName;
  final String animalGender;
  final int animalAge;
  final String problemDescription;
  final int clinicId;
  final String clinicName;
  final int doctorUserId;
  final String doctorFirstName;
  final String doctorLastName;

  AppointmentModel({
    required this.bookingId,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.status,
    required this.userId,
    required this.userFirstName,
    required this.userLastName,
    required this.userEmail,
    required this.sickId,
    required this.animalOwnerName,
    required this.animalGender,
    required this.animalAge,
    required this.problemDescription,
    required this.clinicId,
    required this.clinicName,
    required this.doctorUserId,
    required this.doctorFirstName,
    required this.doctorLastName,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      bookingId: json['booking_id'] ?? 0,
      appointmentDate: json['bookings_appointment_date'] ?? '',
      appointmentTime: json['bookings_appointment_time'] ?? '',
      status: json['bookings_status'] ?? 'pending',
      userId: json['user_id'] ?? 0,
      userFirstName: json['users_first_name'] ?? '',
      userLastName: json['users_last_name'] ?? '',
      userEmail: json['users_email'] ?? '',
      sickId: json['sick_id'] ?? 0,
      animalOwnerName: json['sick_animals_name_owner'] ?? '',
      animalGender: json['sick_animals_gender'] ?? '',
      animalAge: json['sick_animals_age'] ?? 0,
      problemDescription: json['sick_animals_problem_description'] ?? '',
      clinicId: json['clinic_id'] ?? 0,
      clinicName: json['clinics_name'] ?? '',
      doctorUserId: json['doctor_user_id'] ?? 0,
      doctorFirstName: json['doctor_first_name'] ?? '',
      doctorLastName: json['doctor_last_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'booking_id': bookingId,
      'bookings_appointment_date': appointmentDate,
      'bookings_appointment_time': appointmentTime,
      'bookings_status': status,
      'user_id': userId,
      'users_first_name': userFirstName,
      'users_last_name': userLastName,
      'users_email': userEmail,
      'sick_id': sickId,
      'sick_animals_name_owner': animalOwnerName,
      'sick_animals_gender': animalGender,
      'sick_animals_age': animalAge,
      'sick_animals_problem_description': problemDescription,
      'clinic_id': clinicId,
      'clinics_name': clinicName,
      'doctor_user_id': doctorUserId,
      'doctor_first_name': doctorFirstName,
      'doctor_last_name': doctorLastName,
    };
  }

  String get doctorFullName => '$doctorFirstName $doctorLastName';
  String get userFullName => '$userFirstName $userLastName';
  
  String get formattedDate {
    try {
      final date = DateTime.parse(appointmentDate);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return appointmentDate;
    }
  }
  
  String get formattedTime {
    try {
      final time = appointmentTime.split(':');
      final hour = int.parse(time[0]);
      final minute = time[1];
      final period = hour >= 12 ? 'PM' : 'AM';
      final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
      return '$displayHour:$minute $period';
    } catch (e) {
      return appointmentTime;
    }
  }
}