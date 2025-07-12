import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/core/util/class/api.dart';
import 'package:graduation_project/data/models/appointment_model.dart';

class AppointmentsController extends GetxController {
  // Services
  MyServices myServices = Get.find();

  // State variables
  bool isLoading = false;
  List<AppointmentModel> appointments = [];
  List<AppointmentModel> filteredAppointments = [];
  late int userId;
  String? currentStatusFilter; // Store the current status filter

  // API endpoint
  final String apiUrl = 'https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/book/view_user_booking.php';

  @override
  void onInit() async {
    super.onInit();
    userId = myServices.sharedPreferences.getInt("id") ?? 0;
    await fetchAppointments();
  }

  // Fetch appointments from API
  Future<void> fetchAppointments() async {
    try {
      isLoading = true;
      update();

      // Get user ID from shared preferences
      final userId = myServices.sharedPreferences.getInt("id");

      if (userId == null) {
        print('User ID not found in shared preferences');
        return;
      }

      // Prepare request data
      final Map<String, dynamic> requestData = {
        'userid': userId.toString(),
      };

      // Make API call
      final response = await Api().post(body: requestData, uri: apiUrl);

      if (response['status'] == 'success') {
        // Parse appointments
        final List<dynamic> data = response['data'] ?? [];
        appointments = data.map((json) => AppointmentModel.fromJson(json)).toList();

        // Reapply the current filter if it exists
        if (currentStatusFilter != null && currentStatusFilter != 'all') {
          filteredAppointments = appointments
              .where((appointment) => appointment.status.toLowerCase() == currentStatusFilter!.toLowerCase())
              .toList();
        } else {
          filteredAppointments = List.from(appointments);
        }

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

  // Cancel an appointment
  Future<void> cancel(int bookingId) async {
    try {
      isLoading = true;
      update();

      final Map<String, dynamic> requestData = {
        'bookingId': bookingId.toString(),
      };

      final response = await Api().post(
        body: requestData,
        uri: "https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/book/cansel.php",
      );

      if (response['status'] == 'success') {
        // Show success snackbar
        Get.snackbar(
          'Success',
          'Appointment has been cancelled.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );

        await refreshAppointments();
      } else {
        Get.snackbar(
          'Error',
          'Failed to cancel appointment: ${response['message'] ?? 'Unknown error'}',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An unexpected error occurred: $e',
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
      if (currentStatusFilter != null && currentStatusFilter != 'all') {
        filteredAppointments = appointments
            .where((appointment) => appointment.status.toLowerCase() == currentStatusFilter!.toLowerCase())
            .toList();
      } else {
        filteredAppointments = List.from(appointments);
      }
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
    currentStatusFilter = status; // Update the current filter
    if (status == 'all') {
      filteredAppointments = List.from(appointments);
    } else {
      filteredAppointments = appointments
          .where((appointment) => appointment.status.toLowerCase() == status.toLowerCase())
          .toList();
    }
    update();
  }

  // Get appointments count by status
  int getAppointmentsCountByStatus(String status) {
    if (status == 'all') {
      return appointments.length;
    }
    return appointments
        .where((appointment) => appointment.status.toLowerCase() == status.toLowerCase())
        .length;
  }

  // Refresh appointments while preserving filter
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

  // Add rating for an appointment
  Future<void> addRating(int bookingId, int doctorId, double rate) async {
    try {
      isLoading = true;
      update();

      final Map<String, dynamic> requestData = {
        'booking_id': bookingId.toString(),
        'doctor_id': doctorId.toString(),
        'user_id': userId.toString(),
        'rate': rate.toString(),
      };

      final response = await Api().post(
        body: requestData,
        uri: "https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/book/add_rating.php",
      );

      if (response['status'] == 'success') {
        Get.snackbar(
          'Success',
          'Rating submitted successfully!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );

        await refreshAppointments();
      } else {
        Get.snackbar(
          'Error',
          response['message'] ?? 'Failed to submit rating.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An unexpected error occurred while submitting rating: $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading = false;
      update();
    }
  }
}