// lib/models/clinic_model.dart
class Clinic {
  final int clinicId;
  final String name;
  final String phone;
  final String location;
  final String photoUrl;
  final List<ClinicAvailability> availabilities;

  Clinic({
    required this.clinicId,
    required this.name,
    required this.phone,
    required this.location,
    required this.photoUrl,
    required this.availabilities,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      clinicId: json['clinic_id'],
      name: json['clinics_name'],
      phone: json['clinics_phone'],
      location: json['clinics_location'],
      photoUrl: json['clinics_photo_url'],
      availabilities: [], // Will be populated separately
    );
  }
}

class ClinicAvailability {
  final String dayOfWeek;
  final String startTime;
  final String endTime;

  ClinicAvailability({
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });

  factory ClinicAvailability.fromJson(Map<String, dynamic> json) {
    return ClinicAvailability(
      dayOfWeek: json['clinic_availabilities_day_of_week'],
      startTime: json['clinic_availabilities_start_time'],
      endTime: json['clinic_availabilities_end_time'],
    );
  }
}