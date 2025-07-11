import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/package_controller.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';

class PackageSelectionPage extends StatelessWidget {
  

  PackageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PackageController());
    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      body: GetBuilder<PackageController>(
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
                    texts: ["Select Package"],
                    colorsOfTexts: [Colors.black],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: controller.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : controller.packages.isEmpty
                            ? const Center(
                                child: Text(
                                  'No packages available',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: controller.packages.length,
                                itemBuilder: (context, index) {
                                  final package = controller.packages[index];
                                  return _buildPackageCard(package, index);
                                },
                              ),
                  ),
                  const SizedBox(height: 80), // Space for button
                ],
              ),
            ),
            Positioned(
              bottom: 33,
              left: 25,
              right: 25,
              child: Custombutton(
                text: 'Next',
                width: MediaQuery.sizeOf(context).width - 50, // Adjust for padding
                onTap: controller.selectedPackage == null
                    ? null
                    : () {
                        Get.toNamed("/animalownerpage", arguments: {
                          'clinic': controller.clinic,
                          'date': controller.date,
                          'time': controller.time,
                          'package': controller.selectedPackage,
                        });
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageCard(PackageModel package, int index) {
    return GetBuilder<PackageController>(
      builder: (controller) {
        final isSelected = controller.selectedPackageIndex == index;

        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? ColorsApp.primaryColor : const Color(0xffDEDDE1),
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Left side - Icon and package info
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    // Package icon - using communication type icon
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: ColorsApp.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        package.communicationType.icon,
                        color: ColorsApp.primaryColor,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Package details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            package.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            package.communicationType.description,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Right side - Price and selection
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Price
                  Text(
                    '${package.price} EGP',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: ColorsApp.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Duration
                  Text(
                    '/${package.duration} mins',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Selection circle
                  GestureDetector(
                    onTap: () => controller.selectPackage(index),
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? ColorsApp.primaryColor : Colors.grey[400]!,
                          width: 2,
                        ),
                        color: isSelected ? ColorsApp.primaryColor : Colors.transparent,
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}