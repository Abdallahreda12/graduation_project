import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/core/util/class/api.dart';
import 'package:graduation_project/data/models/appointmentForDoctor.dart';
import 'package:graduation_project/data/models/appointment_model.dart';

class AppointmentsController extends GetxController {
  // Services
  MyServices myServices = Get.find();

  // State variables
  bool isLoading = false;
  List<AppointmentModel> appointments = [];
  List<AppointmentModel> filteredAppointments = [];

  late List<BookingData> doctorAppointments;

  // API endpoint
  final String apiUrl =
      'https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/book/view_user_booking.php';

  @override
  void onInit() {
    super.onInit();
    fetchAppointments();
    fetchDoctorAppointments().then((_) {
      // Only print if doctorAppointments is not empty
      if (doctorAppointments.isNotEmpty) {
        print('Doctor appointments loaded: ${doctorAppointments.length}');
        print(
            'First appointment patient: ${doctorAppointments[0].usersFirstName}');
      }
    });
  }

  // Fetch appointments from API
  Future<void> fetchAppointments() async {
    try {
      isLoading = true;
      update();

      // Get user ID from shared preferences
      final userId = myServices.sharedPreferences.getInt("id");
      print(userId);
      if (userId == null) {
        print('User ID not found in shared preferences');
        return;
      }

      // Prepare request data
      final Map<String, dynamic> requestData = {
        'doctorid': "1",
      };

      // Make API call
      final response = await Api().post(body: requestData, uri: apiUrl);

      print("dallahdallahdallah");
      print(response);
      if (response['status'] == 'success') {
        // Parse appointments
        final List<dynamic> data = response['data'] ?? [];
        appointments =
            data.map((json) => AppointmentModel.fromJson(json)).toList();
        filteredAppointments = List.from(appointments);

        print('Fetched ${appointments.length} appointments');
      } else {
        print('API Error: ${response['message'] ?? 'Unknown error'}');
        appointments = [];
        filteredAppointments = [];
      }
    } catch (e) {
      print('Error fetching appointments: $e');
      appointments = [];
      filteredAppointments = [];
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> cansel(int bookingId) async {
    try {
      isLoading = true;
      update();

      final Map<String, dynamic> requestData = {
        'bookingId': bookingId.toString(),
      };

      final response = await Api().post(
        body: requestData,
        uri:
            "https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/book/cansel.php",
      );

      if (response['status'] == 'success') {
        // ✅ Show success snackbar
        Get.snackbar(
          'Success',
          'Appointment has been cancelled.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );

        refreshAppointments();
      } else {
        appointments = [];
        filteredAppointments = [];

        Get.snackbar(
          'Error',
          'Failed to cancel appointment.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      appointments = [];
      filteredAppointments = [];

      Get.snackbar(
        'Error',
        'An unexpected error occurred.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading = false;
      update();
    }
  }

// Update the fetchDoctorAppointments method to properly initialize the list
  Future<List<BookingData>> fetchDoctorAppointments() async {
    try {
      final userId = myServices.sharedPreferences.getInt("id");
      if (userId == null) {
        print("Doctor ID not found in shared preferences");
        doctorAppointments = [];
        return [];
      }

      final Map<String, dynamic> requestData = {
        'doctorid': "1",
      };

      final response = await Api().post(
        body: requestData,
        uri:
            'https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/book/views_doctor_booking.php',
      );
      print(response['status']);
      print(response['data']);

      if (response['status'] == 'success') {
        final BookingResponse bookingResponse =
            BookingResponse.fromJson(response);
        doctorAppointments = bookingResponse.data;
        update(); // Notify listeners
        return bookingResponse.data;
      } else {
        print(
            'Doctor appointments fetch error: ${response['message'] ?? 'Unknown error'}');
        doctorAppointments = [];
        update(); // Notify listeners
        return [];
      }
    } catch (e) {
      print("Error fetching doctor appointments: $e");
      doctorAppointments = [];
      update(); // Notify listeners
      return [];
    }
  }

// Add methods for doctor appointment management
  Future<void> confirmDoctorAppointment(int bookingId) async {
    try {
      isLoading = true;
      update();

      final Map<String, dynamic> requestData = {
        'bookingId': bookingId.toString(),
        'status': 'confirmed',
      };

      final response = await Api().post(
        body: requestData,
        uri:
            "https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/book/update_status.php",
      );

      if (response['status'] == 'success') {
        Get.snackbar(
          'Success',
          'Appointment has been confirmed.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );

        // Refresh doctor appointments
        await fetchDoctorAppointments();
      } else {
        Get.snackbar(
          'Error',
          'Failed to confirm appointment.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error confirming appointment: $e');
      Get.snackbar(
        'Error',
        'An unexpected error occurred.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> cancelDoctorAppointment(int bookingId) async {
    try {
      isLoading = true;
      update();

      final Map<String, dynamic> requestData = {
        'bookingId': bookingId.toString(),
        'status': 'cancelled',
      };

      final response = await Api().post(
        body: requestData,
        uri:
            "https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/book/update_status.php",
      );

      if (response['status'] == 'success') {
        Get.snackbar(
          'Success',
          'Appointment has been cancelled.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );

        // Refresh doctor appointments
        await fetchDoctorAppointments();
      } else {
        Get.snackbar(
          'Error',
          'Failed to cancel appointment.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error cancelling appointment: $e');
      Get.snackbar(
        'Error',
        'An error occurred while cancelling the appointment.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading = false;
      update();
    }
  }

  // Filter appointments by search query
  void filterAppointments(String query) {
    if (query.isEmpty) {
      filteredAppointments = List.from(appointments);
    } else {
      filteredAppointments = appointments.where((appointment) {
        final searchLower = query.toLowerCase();
        return appointment.clinicName.toLowerCase().contains(searchLower) ||
            appointment.animalOwnerName.toLowerCase().contains(searchLower) ||
            appointment.doctorFullName.toLowerCase().contains(searchLower) ||
            appointment.status.toLowerCase().contains(searchLower) ||
            appointment.problemDescription.toLowerCase().contains(searchLower);
      }).toList();
    }
    update();
  }

  // Filter appointments by status
  void filterByStatus(String status) {
    if (status == 'all') {
      filteredAppointments = List.from(appointments);
    } else {
      filteredAppointments = appointments.where((appointment) {
        return appointment.status.toLowerCase() == status.toLowerCase();
      }).toList();
    }
    update();
  }

  // Get appointments count by status
  int getAppointmentsCountByStatus(String status) {
    if (status == 'all') {
      return appointments.length;
    }
    return appointments
        .where((appointment) =>
            appointment.status.toLowerCase() == status.toLowerCase())
        .length;
  }

  // Refresh appointments
  Future<void> refreshAppointments() async {
    await fetchAppointments();
  }

  // Get status color
  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'confirmed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      case 'completed':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  // Get upcoming appointments (today and future)
  List<AppointmentModel> get upcomingAppointments {
    final today = DateTime.now();
    return appointments.where((appointment) {
      try {
        final appointmentDate = DateTime.parse(appointment.appointmentDate);
        return appointmentDate.isAfter(today.subtract(Duration(days: 1)));
      } catch (e) {
        return false;
      }
    }).toList();
  }

  // Get past appointments
  List<AppointmentModel> get pastAppointments {
    final today = DateTime.now();
    return appointments.where((appointment) {
      try {
        final appointmentDate = DateTime.parse(appointment.appointmentDate);
        return appointmentDate.isBefore(today);
      } catch (e) {
        return false;
      }
    }).toList();
  }
}
