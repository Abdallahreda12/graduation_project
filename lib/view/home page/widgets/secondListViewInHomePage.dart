import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/controller/HomePageController.dart';
import 'package:graduation_project/core/class/handleWidgets.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/data/models/adoptionModel.dart';
import 'package:graduation_project/data/models/helpModel.dart';

class SecondListViewInHomePage extends StatelessWidget {
  const SecondListViewInHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageControllerImp>();
    return HandleLoadingIndicator(
        isLoading: controller.isLoading,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Need You",
                  style: AppStyles.urbanistMedium16(context),
                ),
                GestureDetector(
                  onTap: () {
                    controller.goToAdoptAndHelp();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text(
                      "See all",
                      style: AppStyles.urbanistMedium12(context),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                //to view only 8 items not all, adoptionAndHelpRequestPage will show all requestes
                itemCount: controller.mergedItems.length > 8
                    ? 8
                    : controller.mergedItems.length,
                itemBuilder: (context, index) {
                  final item = controller.mergedItems[index];
                  final screenWidth = MediaQuery.of(context).size.width;
                  return controller.hasRequests
                      ? GestureDetector(
                          onTap: () {
                            if (item.type == 'adoption') {
                              Get.toNamed("/adoptiondetailspage",
                                  arguments: item);
                            } else {
                              Get.toNamed("/helpdetailspage", arguments: item);
                            }
                          },
                          child: Container(
                            width: 180,
                            margin: EdgeInsets.only(right: screenWidth * 0.025),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: item.type == 'adoption'
                                    ? ColorsApp.primaryColor
                                    : ColorsApp.secondaryColor,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: screenWidth * 0.025),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                        width: double.infinity,
                                        height:
                                            120, // or whatever height you want
                                        child: CachedNetworkImage(
                                          imageUrl: item.type == 'adoption'
                                              ? '$linkServerImage${(item.data as AdoptionModel).photoUrl}'
                                              : '$linkServerImage${(item.data as HelpRequestModel).photoUrl}',
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 120,
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                            width: double.infinity,
                                            height: 125,
                                            color: Colors.grey.shade300,
                                            child: Icon(
                                              Icons.broken_image,
                                              color: Colors.grey.shade700,
                                              size: 40,
                                            ),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  Text(
                                      item.type == 'adoption'
                                          ? (item.data as AdoptionModel).title
                                          : (item.data as HelpRequestModel)
                                              .title,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.urbanistSemiBold14(
                                          context)),
                                  Text(
                                      item.type == 'adoption'
                                          ? (item.data as AdoptionModel)
                                              .description
                                          : (item.data as HelpRequestModel)
                                              .description,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          AppStyles.urbanistReqular12(context)
                                              .copyWith(
                                                  color: const Color.fromARGB(
                                                      163, 0, 0, 0))),
                                ],
                              ),
                            ),
                          ))
                      : Center(
                          child: Text(
                            "No requests found",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        );
                },
              ),
            )
          ],
        ));
  }
}
