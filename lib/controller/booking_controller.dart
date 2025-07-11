import 'package:get/get.dart';
import 'package:graduation_project/core/class/api.dart';
import 'package:graduation_project/data/models/clinic_model.dart';
import 'package:graduation_project/data/models/doctor_model.dart';
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  List<Clinic> clinics = [];
  Clinic? selectedClinic;
  String? selectedDate;
  String? selectedTime;
  late DoctorModel doctor;
  DateTime currentMonth = DateTime.now();
  bool isLoading = false;
  bool isLoadingTimes = false;
  List<String> availableTimes = [];
  List<String> reservedTimes = []; // Store reserved times from API

  @override
  void onInit() {
    super.onInit();
    doctor = Get.arguments;
    fetchClinics();
  }

  Future<void> fetchClinics() async {
    try {
      isLoading = true;
      update();

      final data = await Api().post(
        uri: 'https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/clinic/view.php',
        body: {"userid": doctor.doctorsUserId.toString()},
      );

      if (data['status'] == 'success') {
        clinics = _parseClinics(data['data']);
      }
    } finally {
      isLoading = false;
      update();
    }
  }

  List<Clinic> _parseClinics(List<dynamic> data) {
    final clinicMap = <int, Clinic>{};

    for (var item in data) {
      final clinicId = item['clinic_id'];
      if (!clinicMap.containsKey(clinicId)) {
        clinicMap[clinicId] = Clinic.fromJson(item);
      }
      clinicMap[clinicId]!.availabilities.add(ClinicAvailability.fromJson(item));
    }

    return clinicMap.values.toList();
  }

  void selectClinic(Clinic clinic) {
    selectedClinic = clinic;
    selectedDate = null;
    selectedTime = null;
    availableTimes = [];
    reservedTimes = [];
    update();
  }

  void selectDate(String date) {
    selectedDate = date;
    selectedTime = null;
    availableTimes = [];
    reservedTimes = [];
    update();
    getAvailableTime();
  }

  void selectTime(String time) {
    selectedTime = time;
    update();
  }

  void selectDateTime(String date, String time) {
    selectedDate = date;
    selectedTime = time;
    update();
  }

  String getCurrentMonthYear() {
    return DateFormat('MMMM yyyy').format(currentMonth);
  }

  void previousMonth() {
    currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
    selectedDate = null;
    selectedTime = null;
    availableTimes = [];
    reservedTimes = [];
    update();
  }

  void nextMonth() {
    currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    selectedDate = null;
    selectedTime = null;
    availableTimes = [];
    reservedTimes = [];
    update();
  }

  List<Map<String, dynamic>> getAvailableDays() {
    if (selectedClinic == null) return [];

    final List<Map<String, dynamic>> availableDays = [];
    final DateTime firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);
    final DateTime lastDayOfMonth = DateTime(currentMonth.year, currentMonth.month + 1, 0);
    final DateTime today = DateTime.now();

    final availableDaysOfWeek = selectedClinic!.availabilities
        .map((a) => _getDayOfWeekNumber(a.dayOfWeek))
        .toSet();

    for (int day = 1; day <= lastDayOfMonth.day; day++) {
      final DateTime date = DateTime(currentMonth.year, currentMonth.month, day);
      if (date.isBefore(DateTime(today.year, today.month, today.day))) {
        continue;
      }

      if (availableDaysOfWeek.contains(date.weekday)) {
        availableDays.add({
          'date': day,
          'dayShort': DateFormat('E').format(date),
          'fullDate': DateFormat('yyyy-MM-dd').format(date),
          'dateTime': date,
        });
      }
    }

    return availableDays;
  }

  int _getDayOfWeekNumber(String dayName) {
    switch (dayName.toLowerCase()) {
      case 'monday':
        return 1;
      case 'tuesday':
        return 2;
      case 'wednesday':
        return 3;
      case 'thursday':
        return 4;
      case 'friday':
        return 5;
      case 'saturday':
        return 6;
      case 'sunday':
        return 7;
      default:
        return 1;
    }
  }

  Future<void> getAvailableTime() async {
    if (selectedClinic == null || selectedDate == null) return;

    try {
      isLoadingTimes = true;
      update();

      final data = await Api().post(
        uri: 'https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/book/view__availabile_time_slots.php',
        body: {
          "clinic_id": selectedClinic!.clinicId.toString(),
          "bookings_appointment_date": selectedDate!,
        },
      );

      if (data['status'] == 'success') {
        reservedTimes = List<String>.from(data['data']);
        // Generate all possible time slots for the selected date
        final dayOfWeek = DateFormat('EEEE').format(DateTime.parse(selectedDate!));
        final availability = selectedClinic!.availabilities
            .firstWhereOrNull((a) => a.dayOfWeek.toLowerCase() == dayOfWeek.toLowerCase());
        if (availability != null) {
          availableTimes = _generateTimeSlots(availability.startTime, availability.endTime);
        } else {
          availableTimes = [];
        }
      } else {
        availableTimes = [];
        reservedTimes = [];
      }
    } catch (e) {
      print('Error fetching available times: $e');
      availableTimes = [];
      reservedTimes = [];
    } finally {
      isLoadingTimes = false;
      update();
    }
  }

  List<Map<String, dynamic>> getAvailableTimesForSelectedDate() {
    // Return time slots with availability status
    return availableTimes.map((time) => {
          'time': time,
          'isReserved': reservedTimes.contains(time),
        }).toList();
  }

  List<String> _generateTimeSlots(String startTime, String endTime) {
    final List<String> timeSlots = [];
    final DateFormat timeFormat = DateFormat('HH:mm');

    try {
      DateTime start = timeFormat.parse(startTime);
      DateTime end = timeFormat.parse(endTime);

      // Handle cases where end time crosses midnight
      if (end.hour < start.hour) {
        end = end.add(Duration(days: 1));
      }

      while (start.isBefore(end)) {
        timeSlots.add(timeFormat.format(start));
        start = start.add(Duration(minutes: 30));
      }
    } catch (e) {
      print('Error generating time slots: $e');
      timeSlots.addAll([startTime, endTime]);
    }

    return timeSlots;
  }
}