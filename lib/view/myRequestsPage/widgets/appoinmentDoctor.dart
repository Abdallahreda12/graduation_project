import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/my_requsts_controller.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/data/models/appointmentForDoctor.dart';

class DoctorAppointmentsView extends StatefulWidget {
  const DoctorAppointmentsView({Key? key}) : super(key: key);

  @override
  State<DoctorAppointmentsView> createState() => _DoctorAppointmentsViewState();
}

class _DoctorAppointmentsViewState extends State<DoctorAppointmentsView> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedStatusFilter = 'all';
  List<BookingData> _filteredAppointments = [];

  @override
  void initState() {
    super.initState();
    // Initialize the appointments controller if not already done
    if (!Get.isRegistered<AppointmentsController>()) {
      Get.put(AppointmentsController());
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterAppointments(AppointmentsController controller, String query) {
    setState(() {
      if (query.isEmpty && _selectedStatusFilter == 'all') {
        _filteredAppointments = List.from(controller.doctorAppointments);
      } else {
        _filteredAppointments =
            controller.doctorAppointments.where((appointment) {
          final searchLower = query.toLowerCase();
          final matchesSearch = query.isEmpty ||
              appointment.usersFirstName.toLowerCase().contains(searchLower) ||
              appointment.usersLastName.toLowerCase().contains(searchLower) ||
              appointment.sickAnimalsGender
                  .toLowerCase()
                  .contains(searchLower) ||
              appointment.sickAnimalsProblemDescription
                  .toLowerCase()
                  .contains(searchLower);

          final matchesStatus = _selectedStatusFilter == 'all' ||
              appointment.bookingsStatus.toLowerCase() ==
                  _selectedStatusFilter.toLowerCase();

          return matchesSearch && matchesStatus;
        }).toList();
      }
    });
  }

  void _filterByStatus(AppointmentsController controller, String status) {
    setState(() {
      _selectedStatusFilter = status;
      _filterAppointments(controller, _searchController.text);
    });
  }

  int _getAppointmentsCountByStatus(
      AppointmentsController controller, String status) {
    if (status == 'all') {
      return controller.doctorAppointments.length;
    }
    return controller.doctorAppointments
        .where((appointment) =>
            appointment.bookingsStatus.toLowerCase() == status.toLowerCase())
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentsController>(
      builder: (appointmentsController) {
        // Initialize filtered appointments if empty
        if (_filteredAppointments.isEmpty &&
            appointmentsController.doctorAppointments.isNotEmpty) {
          _filteredAppointments =
              List.from(appointmentsController.doctorAppointments);
        }

        return Column(
          children: [
            // Search and filter section
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  // Search bar
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search patient appointments...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: ColorsApp.primaryColor),
                      ),
                    ),
                    onChanged: (value) {
                      _filterAppointments(appointmentsController, value);
                    },
                  ),
                  SizedBox(height: 12),

                  // Status filter chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterChip('All', 'all', appointmentsController),
                        _buildFilterChip(
                            'Pending', 'pending', appointmentsController),
                        _buildFilterChip(
                            'Confirmed', 'confirmed', appointmentsController),
                        _buildFilterChip(
                            'Completed', 'completed', appointmentsController),
                        _buildFilterChip(
                            'Cancelled', 'cancelled', appointmentsController),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Content area
            Expanded(
              child: appointmentsController.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: ColorsApp.primaryColor,
                      ),
                    )
                  : _filteredAppointments.isEmpty
                      ? _buildEmptyState(appointmentsController)
                      : RefreshIndicator(
                          onRefresh: () async {
                            await appointmentsController
                                .fetchDoctorAppointments();
                            _filterAppointments(
                                appointmentsController, _searchController.text);
                          },
                          color: ColorsApp.primaryColor,
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            itemCount: _filteredAppointments.length,
                            itemBuilder: (context, index) {
                              final appointment = _filteredAppointments[index];
                              return _buildDoctorAppointmentCard(
                                  appointment, appointmentsController);
                            },
                          ),
                        ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDoctorAppointmentCard(
      BookingData appointment, AppointmentsController controller) {
    final statusColor = _getStatusColor(appointment.bookingsStatus);

    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => _showDoctorAppointmentDetails(appointment),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with patient name and status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${appointment.usersFirstName} ${appointment.usersLastName}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: statusColor.withOpacity(0.3)),
                    ),
                    child: Text(
                      appointment.bookingsStatus.toUpperCase(),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: statusColor,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),

              // Animal info
              Row(
                children: [
                  Icon(Icons.pets, size: 16, color: Colors.grey[600]),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Animal: ${appointment.sickAnimalsGender}, ${appointment.sickAnimalsAge} years old',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 8),

              // Date and time
              Row(
                children: [
                  Icon(Icons.schedule, size: 16, color: Colors.grey[600]),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${appointment.bookingsAppointmentDate} at ${appointment.bookingsAppointmentTime}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),

              // Problem description preview
              if (appointment.sickAnimalsProblemDescription.isNotEmpty) ...[
                SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    appointment.sickAnimalsProblemDescription.length > 100
                        ? '${appointment.sickAnimalsProblemDescription.substring(0, 100)}...'
                        : appointment.sickAnimalsProblemDescription,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      height: 1.3,
                    ),
                  ),
                ),
              ],

              // Action buttons for pending appointments
              if (appointment.bookingsStatus.toLowerCase() == 'pending') ...[
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () =>
                            _showConfirmDialog(appointment, controller),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8),
                        ),
                        child: Text('Confirm', style: TextStyle(fontSize: 13)),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () =>
                            _showCancelDialog(appointment, controller),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8),
                        ),
                        child: Text('Cancel', style: TextStyle(fontSize: 13)),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(
      String label, String value, AppointmentsController controller) {
    final isSelected = _selectedStatusFilter == value;
    final count = _getAppointmentsCountByStatus(controller, value);

    return Container(
      margin: EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(
          '$label${count > 0 ? ' ($count)' : ''}',
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected ? Colors.white : ColorsApp.primaryColor,
          ),
        ),
        selected: isSelected,
        onSelected: (bool selected) {
          _filterByStatus(controller, value);
        },
        selectedColor: ColorsApp.primaryColor,
        backgroundColor: Colors.white,
        side: BorderSide(color: ColorsApp.primaryColor, width: 1),
        showCheckmark: false,
        elevation: isSelected ? 2 : 0,
      ),
    );
  }

  Widget _buildEmptyState(AppointmentsController controller) {
    String message = _selectedStatusFilter == 'all'
        ? 'No patient appointments found'
        : 'No ${_selectedStatusFilter.toLowerCase()} appointments found';

    String subtitle = _selectedStatusFilter == 'all'
        ? 'Patient appointments will appear here'
        : 'Try selecting a different status or refresh the page';

    return RefreshIndicator(
      onRefresh: () async {
        await controller.fetchDoctorAppointments();
        _filterAppointments(controller, _searchController.text);
      },
      color: ColorsApp.primaryColor,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(height: 60),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.medical_services_outlined,
                  size: 64,
                  color: Colors.grey[400],
                ),
                SizedBox(height: 16),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    await controller.fetchDoctorAppointments();
                    _filterAppointments(controller, _searchController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsApp.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Refresh'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDoctorAppointmentDetails(BookingData appointment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Patient Appointment Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.primaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.close),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  ],
                ),

                SizedBox(height: 16),

                // Patient info
                _buildDetailRow('Patient Name',
                    '${appointment.usersFirstName} ${appointment.usersLastName}'),
                _buildDetailRow('Date', appointment.bookingsAppointmentDate),
                _buildDetailRow('Time', appointment.bookingsAppointmentTime),
                _buildDetailRow(
                    'Status', appointment.bookingsStatus.toUpperCase()),
                _buildDetailRow('Animal',
                    '${appointment.sickAnimalsGender}, ${appointment.sickAnimalsAge} years old'),

                if (appointment.sickAnimalsProblemDescription.isNotEmpty) ...[
                  SizedBox(height: 12),
                  Text(
                    'Problem Description:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      appointment.sickAnimalsProblemDescription,
                      style: TextStyle(
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                    ),
                  ),
                ],

                SizedBox(height: 20),

                // Action buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.grey[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text('Close'),
                      ),
                    ),
                    if (appointment.bookingsStatus.toLowerCase() ==
                        'pending') ...[
                      SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _showConfirmDialog(appointment,
                                Get.find<AppointmentsController>());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsApp.primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text('Confirm'),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmDialog(
      BookingData appointment, AppointmentsController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Confirm Appointment',
            style: TextStyle(
              color: ColorsApp.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to confirm this appointment?\n\nPatient: ${appointment.usersFirstName} ${appointment.usersLastName}\nDate: ${appointment.bookingsAppointmentDate}\nTime: ${appointment.bookingsAppointmentTime}',
            style: TextStyle(height: 1.4),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement confirm appointment API call
                Navigator.of(context).pop();
                _confirmAppointment(appointment, controller);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _showCancelDialog(
      BookingData appointment, AppointmentsController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Cancel Appointment',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to cancel this appointment?\n\nPatient: ${appointment.usersFirstName} ${appointment.usersLastName}\nDate: ${appointment.bookingsAppointmentDate}\nTime: ${appointment.bookingsAppointmentTime}',
            style: TextStyle(height: 1.4),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Keep',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement cancel appointment API call
                Navigator.of(context).pop();
                _cancelAppointment(appointment, controller);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _confirmAppointment(
      BookingData appointment, AppointmentsController controller) {
    // TODO: Implement API call to confirm appointment
    Get.snackbar(
      'Appointment Confirmed',
      'The appointment has been confirmed successfully.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: EdgeInsets.all(16),
      borderRadius: 8,
    );

    // Refresh appointments
    controller.fetchDoctorAppointments().then((_) {
      _filterAppointments(controller, _searchController.text);
    });
  }

  void _cancelAppointment(
      BookingData appointment, AppointmentsController controller) {
    // TODO: Implement API call to cancel appointment
    Get.snackbar(
      'Appointment Cancelled',
      'The appointment has been cancelled successfully.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: EdgeInsets.all(16),
      borderRadius: 8,
    );

    // Refresh appointments
    controller.fetchDoctorAppointments().then((_) {
      _filterAppointments(controller, _searchController.text);
    });
  }

  Color _getStatusColor(String status) {
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
}
