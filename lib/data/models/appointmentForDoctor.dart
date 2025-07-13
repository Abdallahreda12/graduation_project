class BookingResponse {
  final String status;
  final List<BookingData> data;

  BookingResponse({
    required this.status,
    required this.data,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      status: json['status'],
      data: (json['data'] as List).map((e) => BookingData.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class BookingData {
  final int bookingId;
  final String bookingsAppointmentDate;
  final String bookingsAppointmentTime;
  final String bookingsStatus;
  final int userId;
  final String usersFirstName;
  final String usersLastName;
  final String usersEmail;
  final int sickId;
  final String sickAnimalsNameOwner;
  final String sickAnimalsGender;
  final int sickAnimalsAge;
  final String sickAnimalsProblemDescription;
  final int clinicId;
  final String clinicsName;
  final int doctorUserId;
  final String doctorFirstName;
  final String doctorLastName;

  BookingData({
    required this.bookingId,
    required this.bookingsAppointmentDate,
    required this.bookingsAppointmentTime,
    required this.bookingsStatus,
    required this.userId,
    required this.usersFirstName,
    required this.usersLastName,
    required this.usersEmail,
    required this.sickId,
    required this.sickAnimalsNameOwner,
    required this.sickAnimalsGender,
    required this.sickAnimalsAge,
    required this.sickAnimalsProblemDescription,
    required this.clinicId,
    required this.clinicsName,
    required this.doctorUserId,
    required this.doctorFirstName,
    required this.doctorLastName,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) {
    return BookingData(
      bookingId: json['booking_id'],
      bookingsAppointmentDate: json['bookings_appointment_date'],
      bookingsAppointmentTime: json['bookings_appointment_time'],
      bookingsStatus: json['bookings_status'],
      userId: json['user_id'],
      usersFirstName: json['users_first_name'],
      usersLastName: json['users_last_name'],
      usersEmail: json['users_email'],
      sickId: json['sick_id'],
      sickAnimalsNameOwner: json['sick_animals_name_owner'],
      sickAnimalsGender: json['sick_animals_gender'],
      sickAnimalsAge: json['sick_animals_age'],
      sickAnimalsProblemDescription: json['sick_animals_problem_description'],
      clinicId: json['clinic_id'],
      clinicsName: json['clinics_name'],
      doctorUserId: json['doctor_user_id'],
      doctorFirstName: json['doctor_first_name'],
      doctorLastName: json['doctor_last_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'booking_id': bookingId,
      'bookings_appointment_date': bookingsAppointmentDate,
      'bookings_appointment_time': bookingsAppointmentTime,
      'bookings_status': bookingsStatus,
      'user_id': userId,
      'users_first_name': usersFirstName,
      'users_last_name': usersLastName,
      'users_email': usersEmail,
      'sick_id': sickId,
      'sick_animals_name_owner': sickAnimalsNameOwner,
      'sick_animals_gender': sickAnimalsGender,
      'sick_animals_age': sickAnimalsAge,
      'sick_animals_problem_description': sickAnimalsProblemDescription,
      'clinic_id': clinicId,
      'clinics_name': clinicsName,
      'doctor_user_id': doctorUserId,
      'doctor_first_name': doctorFirstName,
      'doctor_last_name': doctorLastName,
    };
  }
}