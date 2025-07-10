import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/controller/ViewMyRequestsController.dart';
import 'package:graduation_project/core/class/handleWidgets.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/data/models/adoptionModel.dart';
import 'package:graduation_project/data/models/helpModel.dart';
import 'package:graduation_project/view/adoption%20And%20Help%20Page/widgets/searchBarInAdoptionAndHelpPage.dart';
import 'package:graduation_project/view/myRequestsPage/widgets/adoptionAndHelpCardInMyRequestsPage.dart';

class MyRequestsPage extends StatefulWidget {
  const MyRequestsPage({super.key});

  @override
  State<MyRequestsPage> createState() => _MyRequestsPageState();
}

class _MyRequestsPageState extends State<MyRequestsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
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
                      texts: ["My Requests & appointment"],
                      colorsOfTexts: [ColorsApp.primaryColor],
                    ),
                    const SizedBox(height: 10),

                    // Tab bar
                    TabBar(
                      controller: _tabController,
                      labelColor: ColorsApp.primaryColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: ColorsApp.primaryColor,
                      tabs: const [
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

                          // Appointments tab content (placeholder for now)
                          Center(
                            child: Text(
                              'No Appointments yet.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
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
}
