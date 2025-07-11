import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/booking_controller.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/view/bookPages/BookingPage/widgets/DoctoCardInBookingPage.dart';
import 'package:graduation_project/view/profile%20page/widgets/buildDropDownRow.dart';

class BookingPage extends StatelessWidget {
  final BookingController _controller = Get.put(BookingController());

  BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      body: GetBuilder<BookingController>(
        builder: (controller) => Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                Assets.imagesLogoInverse,
                fit: BoxFit.none,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
              child: Column(
                children: [
                  TextAndBackArrowHeader(
                    texts: ["Available Date"],
                    colorsOfTexts: [Colors.black],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DoctorCardInBookingPage(
                              doctorModel: controller.doctor),
                          _buildClinicDropdown(context),
                          if (controller.selectedClinic != null)
                            _buildDateSelectionSection(),
                          const SizedBox(
                              height: 80), // For spacing above button
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 33,
              left: 25,
              right: 25,
              child: Custombutton(
                text: 'Next',
                width: MediaQuery.sizeOf(context).width,
                onTap: (controller.selectedDate == null ||
                        controller.selectedTime == null)
                    ? null
                    : () {
                        Get.toNamed("/PackageSelectionPage", arguments: {
                          'clinic': controller.selectedClinic,
                          'date': controller.selectedDate,
                          'time': controller.selectedTime,
                        });
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClinicDropdown(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffDEDDE1)),
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xffF5F7FB),
      ),
      child: GetBuilder<BookingController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            );
          }
          return IntrinsicWidth(
            child: BuildDropdownRow(
              isShowSelcetedValue: false,
              spaceBetweenRowAndLabel: 50,
              mainAxisAlign: MainAxisAlignment.center,
              context: context,
              label: controller.selectedClinic?.name ?? 'Select Clinic',
              selectedValue: controller.selectedClinic?.name ?? 'Select Clinic',
              options: controller.clinics.map((e) => e.name).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  controller.selectClinic(
                      controller.clinics.firstWhere((e) => e.name == value));
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildDateSelectionSection() {
    return GetBuilder<BookingController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Select Date',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            _buildMonthNavigation(),
            const SizedBox(height: 15),
            _buildDaysHorizontalList(),
            const SizedBox(height: 20),
            if (controller.selectedDate != null) _buildTimeSlots(),
          ],
        );
      },
    );
  }

  Widget _buildMonthNavigation() {
    return GetBuilder<BookingController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => controller.previousMonth(),
              icon: const Icon(Icons.arrow_back_ios, size: 20),
            ),
            Text(
              controller.getCurrentMonthYear(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () => controller.nextMonth(),
              icon: const Icon(Icons.arrow_forward_ios, size: 20),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDaysHorizontalList() {
    return GetBuilder<BookingController>(
      builder: (controller) {
        return Container(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.getAvailableDays().length,
            itemBuilder: (context, index) {
              final day = controller.getAvailableDays()[index];
              final isSelected = controller.selectedDate == day['fullDate'];

              return GestureDetector(
                onTap: () {
                  controller.selectDate(day['fullDate']);
                },
                child: Container(
                  width: 60,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ColorsApp.primaryColor
                        : const Color(0xffF5F7FB),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? ColorsApp.primaryColor
                          : const Color(0xffDEDDE1),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        day['dayShort'],
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected ? Colors.white : Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        day['date'].toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildTimeSlots() {
    return GetBuilder<BookingController>(
      builder: (controller) {
        if (controller.isLoadingTimes) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final timeSlots = controller.getAvailableTimesForSelectedDate();

        if (timeSlots.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                'No available times for this date',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available Times',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: timeSlots.map((slot) {
                final time = slot['time'] as String;
                final isReserved = slot['isReserved'] as bool;
                final isSelected = controller.selectedTime == time;
                final formattedTime =
                    time.length > 5 ? time.substring(0, 5) : time;

                return GestureDetector(
                  onTap: isReserved ? null : () => controller.selectTime(time),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isReserved
                          ? Colors.grey[400]
                          : isSelected
                              ? ColorsApp.primaryColor
                              : const Color(0xffF5F7FB),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isReserved
                            ? Colors.grey[500]!
                            : isSelected
                                ? ColorsApp.primaryColor
                                : const Color(0xffDEDDE1),
                      ),
                    ),
                    child: Text(
                      formattedTime,
                      style: TextStyle(
                        color: isReserved
                            ? Colors.grey[700]
                            : isSelected
                                ? Colors.white
                                : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
