import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/mainBookPageController.dart';
import 'package:graduation_project/core/Widgets/customBottomAppBar.dart';
import 'package:graduation_project/core/Widgets/customPlusBottunInAppBar.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/bookPages/mainBookPage/widgets/BannerOfMainBookPage.dart';
import 'package:graduation_project/view/bookPages/mainBookPage/widgets/DoctorCard.dart';
import 'package:graduation_project/view/bookPages/mainBookPage/widgets/searchBarInMainBookPage.dart';

class MainBookPage extends StatelessWidget {
  const MainBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    Get.put(MainbookpagecontrollerImp());

    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      floatingActionButton: CustomPlusBottunInAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: const CustomBottomAppBar(
        currentPageIndex: 2,
      ),
      body: GetBuilder<MainbookpagecontrollerImp>(
       
        builder: (controller) => Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                Assets.imagesLogoInverse,
                fit: BoxFit.none,
              ),
            ),
            RefreshIndicator(
              onRefresh: controller.refreshDoctors,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Banner of the page
                   const BannerOfMainBookPage(),

                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SearchbarInMainBookPage(
                        controller: controller.searchController,
                        onChanged: controller.searchDoctors,
                        onClear: controller.clearSearch,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Veterinary",
                            style: AppStyles.urbanistSemiBold18(context),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Doctor list with loading, error, and empty states
                    if (controller.isLoading)
                      Container(
                        height: 200,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorsApp.primaryColor,
                          ),
                        ),
                      )
                    else if (controller.errorMessage.isNotEmpty)
                      Container(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error_outline,
                                size: 64,
                                color: Colors.red,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                controller.errorMessage,
                                style: AppStyles.urbanistReqular12(context),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: controller.fetchDoctors,
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      )
                    else if (controller.filteredDoctors.isEmpty)
                      Container(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.search_off,
                                size: 64,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                controller.searchController.text.isEmpty
                                    ? 'No doctors available'
                                    : 'No doctors found for "${controller.searchController.text}"',
                                style: AppStyles.urbanistReqular12(context),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 12,
                          children: controller.filteredDoctors.map((doctor) {
                            return GestureDetector(
                              onTap: () {
                         
                                  Get.toNamed("/DoctorDetailsPage", arguments: doctor);
                                
                                
                                
                              },
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2 - 20,
                                child: DoctorCard(
                                  photo: doctor.usersPhotoUrl,
                                  name: doctor.fullName,
                                  description: doctor.doctorsSpecialization,
                                  stars: doctor.averageRating.toString(),
                                  doctorModel: doctor,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}