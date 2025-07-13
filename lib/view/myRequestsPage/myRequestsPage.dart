import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/controller/ViewMyRequestsController.dart';
import 'package:graduation_project/controller/my_requsts_controller.dart';
import 'package:graduation_project/core/class/handleWidgets.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/data/models/adoptionModel.dart';
import 'package:graduation_project/data/models/helpModel.dart';
import 'package:graduation_project/data/models/appointment_model.dart';
import 'package:graduation_project/view/adoption%20And%20Help%20Page/widgets/searchBarInAdoptionAndHelpPage.dart';
import 'package:graduation_project/view/myRequestsPage/widgets/adoptionAndHelpCardInMyRequestsPage.dart';
import 'package:graduation_project/view/myRequestsPage/widgets/appoinmentDoctor.dart';
import 'package:graduation_project/view/myRequestsPage/widgets/appointment_card.dart';

class MyRequestsPage extends StatefulWidget {
  const MyRequestsPage({super.key});

  @override
  State<MyRequestsPage> createState() => _MyRequestsPageState();
}

class _MyRequestsPageState extends State<MyRequestsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _selectedStatusFilter = 'all';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Initialize appointments controller
    Get.put(AppointmentsController());
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ViewMyRequestsControllerImp());

    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      resizeToAvoidBottomInset: false,
      body: GetBuilder<ViewMyRequestsControllerImp>(builder: (controller) {
        // controller.getRequest();
        return HandleLoadingIndicator(
          isLoading: controller.isLoading,
          widget: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  Assets.imagesLogoInverse,
                  fit: BoxFit.none,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
                child: Column(
                  children: [
                    // Header
                    TextAndBackArrowHeader(
                      onTap: () {
                        Get.toNamed("/homepage");
                      },
                      texts: ["My Requests & Appointments"],
                      colorsOfTexts: [ColorsApp.primaryColor],
                    ),
                    const SizedBox(height: 10),

                    // Tab bar
                    TabBar(
                      controller: _tabController,
                      labelColor: ColorsApp.primaryColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: ColorsApp.primaryColor,
                      tabs: [
                        Tab(text: 'Requests'),
                        Tab(text: 'Appointments'),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Requests tab content
                          Column(
                            children: [
                              SearchbarInAdoptionAndHelpPage(),
                              const SizedBox(height: 10),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: controller.mergedItems.length,
                                  itemBuilder: (context, index) {
                                    final item = controller.mergedItems[index];
                                    return item.type == "adoption"
                                        ? AdoptionAndHelpCardInMyRequestsPage(
                                            image:
                                                '$linkServerImage${(item.data as AdoptionModel).photoUrl}',
                                            title: (item.data as AdoptionModel)
                                                .title,
                                            subtitle:
                                                (item.data as AdoptionModel)
                                                    .description,
                                            typeOfCard: 'adoption',
                                            contact:
                                                (item.data as AdoptionModel)
                                                    .phone,
                                            onTap: () {
                                              Get.offNamed(
                                                  "/adoptiondetailspageWithDeleteButton",
                                                  arguments: item);
                                            },
                                          )
                                        : AdoptionAndHelpCardInMyRequestsPage(
                                            image:
                                                '$linkServerImage${(item.data as HelpRequestModel).photoUrl}',
                                            title:
                                                (item.data as HelpRequestModel)
                                                    .title,
                                            subtitle:
                                                (item.data as HelpRequestModel)
                                                    .description,
                                            typeOfCard: 'help',
                                            contact:
                                                (item.data as HelpRequestModel)
                                                    .phone,
                                            onTap: () {
                                              Get.offNamed(
                                                  "/helpdetailspageWithDeleteButton",
                                                  arguments: item);
                                            },
                                          );
                                  },
                                ),
                              ),
                            ],
                          ),
                          userType == 0
                              ?
                              // Appointments tab content
                              GetBuilder<AppointmentsController>(
                                  builder: (appointmentsController) {
                                    return Column(
                                      children: [
                                        // Search and filter section - Always visible
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          child: Column(
                                            children: [
                                              // Search bar
                                              TextField(
                                                controller: _searchController,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Search appointments...',
                                                  prefixIcon:
                                                      Icon(Icons.search),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.grey[300]!),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.grey[300]!),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    borderSide: BorderSide(
                                                        color: ColorsApp
                                                            .primaryColor),
                                                  ),
                                                ),
                                                onChanged: (value) {
                                                  appointmentsController
                                                      .filterAppointments(
                                                          value);
                                                },
                                              ),

                                              SizedBox(height: 12),

                                              // Status filter chips - Always visible
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    _buildFilterChip(
                                                        'All',
                                                        'all',
                                                        appointmentsController),
                                                    _buildFilterChip(
                                                        'Pending',
                                                        'pending',
                                                        appointmentsController),
                                                    _buildFilterChip(
                                                        'Confirmed',
                                                        'confirmed',
                                                        appointmentsController),
                                                    _buildFilterChip(
                                                        'Completed',
                                                        'completed',
                                                        appointmentsController),
                                                    _buildFilterChip(
                                                        'Cancelled',
                                                        'cancelled',
                                                        appointmentsController),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Content area - Loading, Empty, or List
                                        Expanded(
                                          child: appointmentsController
                                                  .isLoading
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        ColorsApp.primaryColor,
                                                  ),
                                                )
                                              : appointmentsController
                                                      .filteredAppointments
                                                      .isEmpty
                                                  ? _buildEmptyState(
                                                      appointmentsController)
                                                  : RefreshIndicator(
                                                      onRefresh:
                                                          appointmentsController
                                                              .refreshAppointments,
                                                      color: ColorsApp
                                                          .primaryColor,
                                                      child: ListView.builder(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 16),
                                                        itemCount:
                                                            appointmentsController
                                                                .filteredAppointments
                                                                .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          final appointment =
                                                              appointmentsController
                                                                      .filteredAppointments[
                                                                  index];
                                                          return AppointmentCard(
                                                            appointment:
                                                                appointment,
                                                            onTap: () {
                                                              _showAppointmentDetails(
                                                                  appointment);
                                                            },
                                                            onCancel: appointment
                                                                        .status
                                                                        .toLowerCase() ==
                                                                    'pending'
                                                                ? () {
                                                                    _showCancelConfirmation(
                                                                        appointment,
                                                                        appointmentsController);
                                                                  }
                                                                : null,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                        ),
                                      ],
                                    );
                                  },
                                )
                              //for doctor
                              : DoctorAppointmentsView()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // Build empty state widget
  Widget _buildEmptyState(AppointmentsController controller) {
    String message = _selectedStatusFilter == 'all'
        ? 'No appointments found'
        : 'No ${_selectedStatusFilter.toLowerCase()} appointments found';

    String subtitle = _selectedStatusFilter == 'all'
        ? 'Your booked appointments will appear here'
        : 'Try selecting a different status or refresh the page';

    return RefreshIndicator(
      onRefresh: controller.refreshAppointments,
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
                  _selectedStatusFilter == 'all'
                      ? Icons.calendar_today
                      : Icons.filter_list_off,
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
                  onPressed: () {
                    controller.refreshAppointments();
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

  // Build filter chip widget
  Widget _buildFilterChip(
      String label, String value, AppointmentsController controller) {
    final isSelected = _selectedStatusFilter == value;
    final count = controller.getAppointmentsCountByStatus(value);

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
          setState(() {
            _selectedStatusFilter = value;
          });
          controller.filterByStatus(value);
        },
        selectedColor: ColorsApp.primaryColor,
        backgroundColor: Colors.white,
        side: BorderSide(
          color: ColorsApp.primaryColor,
          width: 1,
        ),
        showCheckmark: false,
        elevation: isSelected ? 2 : 0,
      ),
    );
  }

  // Show appointment details dialog
  void _showAppointmentDetails(AppointmentModel appointment) {
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
                      'Appointment Details',
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

                // Appointment info
                _buildDetailRow('Clinic', appointment.clinicName),
                _buildDetailRow('Doctor', 'Dr. ${appointment.doctorFullName}'),
                _buildDetailRow('Date', appointment.formattedDate),
                _buildDetailRow('Time', appointment.formattedTime),
                _buildDetailRow('Status', appointment.status.toUpperCase()),
                _buildDetailRow('Owner', appointment.animalOwnerName),
                _buildDetailRow('Animal',
                    '${appointment.animalGender}, ${appointment.animalAge} years old'),

                if (appointment.problemDescription.isNotEmpty) ...[
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
                      appointment.problemDescription,
                      style: TextStyle(
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                    ),
                  ),
                ],

                SizedBox(height: 20),

                // Close button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Build detail row widget
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

  // Show cancel confirmation dialog
  void _showCancelConfirmation(
      AppointmentModel appointment, AppointmentsController controller) {
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
              color: ColorsApp.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to cancel this appointment?\n\nClinic: ${appointment.clinicName}\nDate: ${appointment.formattedDate}\nTime: ${appointment.formattedTime}',
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
                controller.cansel(appointment.bookingId);
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

  // Cancel appointment (placeholder for API implementation)
  void _cancelAppointment(
      AppointmentModel appointment, AppointmentsController controller) {
    // TODO: Implement API call to cancel appointment
    // For now, just show a snackbar
    Get.snackbar(
      'Appointment Cancelled',
      'Your appointment has been cancelled successfully.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: EdgeInsets.all(16),
      borderRadius: 8,
    );

    // Refresh appointments
    controller.refreshAppointments();
  }
}
