import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/view/bookPages/BookingPage/widgets/DoctoCardInBookingPage.dart';
import 'package:graduation_project/view/profile%20page/widgets/buildDropDownRow.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  ///////for CalenderBook
  // Stream<List<DateTimeRange>> getBookingStreamMock({
  //   required DateTime end,
  //   required DateTime start,
  // }) async* {
  //   yield [
  //     DateTimeRange(
  //       start: DateTime.now().add(Duration(hours: 2)),
  //       end: DateTime.now().add(Duration(hours: 3)),
  //     ),
  //   ];
  // }

  // List<DateTimeRange> convertStreamResultMock(dynamic streamResult) {
  //   return <DateTimeRange>[
  //     DateTimeRange(
  //       start: DateTime.now().add(Duration(hours: 2)),
  //       end: DateTime.now().add(Duration(hours: 3)),
  //     ),
  //   ];
  // }

  String selectedClinic = 'Select Clinic';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      body: Stack(children: [
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
              //
              //header of page
              //
              TextAndBackArrowHeader(
                  texts: ["Available Date"], colorsOfTexts: [Colors.black]),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //
                      //DoctorCard
                      //
                      DoctoCardInBookingPage(),
                      //
                      //DropDown
                      //
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffDEDDE1)),
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xffF5F7FB)),
                        child: IntrinsicWidth(
                          child: BuildDropdownRow(
                            isShowSelcetedValue: false,
                            spaceBetweenRowAndLabel: 50,
                            mainAxisAlign: MainAxisAlignment.center,
                            context: context,
                            label: selectedClinic,
                            selectedValue: selectedClinic,
                            options: ["Minya Alqamh", "Cairo"],
                            onChanged: (String? value) {
                              setState(() {
                                selectedClinic = value!;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ), // ➕ Add Booking Calendar widget below
              const SizedBox(height: 20),
              //////make this when api finished
              // BookingCalendar(
              //   bookingService: BookingService(
              //     serviceName: 'Vet Booking',
              //     serviceDuration: 30,
              //     bookingEnd: DateTime.now().add(Duration(days: 30)),
              //     bookingStart: DateTime.now(),
              //   ),
              //   //Replace this part with code that saves the booking to your backend, like Firebase Firestore, Supabase, or a REST API.
              //   uploadBooking: (BookingService newBooking) {//},
              //   getBookingStream: getBookingStreamMock,
              //   convertStreamResultToDateTimeRanges: convertStreamResultMock,
              // ),
            ],
          ),
        ),
        Positioned(
          bottom: 33,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Custombutton(
              text: 'Next',
              width: MediaQuery.sizeOf(context).width,
              onTap: () {
                Get.toNamed("/animalownerpage");
              },
            ),
          ),
        ),
      ]),
    );
  }
}
