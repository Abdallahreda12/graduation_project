import 'package:get/get.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/controller/ViewMyRequestsController.dart';
import 'package:graduation_project/controller/loginController.dart';
import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/data/models/adoptionModel.dart';
import 'package:graduation_project/data/models/helpModel.dart';
import 'package:graduation_project/data/services/homeData.dart';
import 'package:graduation_project/view/tips%20and%20tricks%20pages/Data/TipsAndTricksForYourPetsPageData.dart';

abstract class HomePageController extends GetxController {
  goToAdoptAndHelp();
  goToChats();
  goToDoctors();
  goToAllRequests();
  goToNotifacation();
  goToChatBoot();
  goToSpecificReques();
  goTospecificTopiInTipsAndTricks(int index);
  getHeaderInTipsAndTricks();
  getRequest();
}

class HomePageControllerImp extends HomePageController {
  late int userId;
  String firstName = "";
  bool hasRequests = true;
  bool isLoading = false;
  final List<AdoptionModel> adoptions = [];
  final List<HelpRequestModel> helpRequests = [];
  MyServices myServices = Get.find();
  List<UnifiedItem> mergedItems = [];
  //this list that will shown it in the home page (Take care the names must be the same in the TipsAndTricksForYOurPetsData)
  final List<String> tipsAndTricksList = [
    "Recommended food",
    "Human foods that are toxic",
    "Common diseases and symptoms",
    "What to do if your pet goes missing",
    "First aid tips",
    "Pet insurance info",
    "Daily activity needs",
    "Obedience training basics"
  ];

  //photos that i used it
  final List<String> tipsAndTricksPhotos = [
    Assets.imagesRecommendedFood,
    Assets.imagesHumanFoodsThatAreToxic,
    Assets.imagesCommonDiseasesAndSymptoms,
    Assets.imagesWhattToDoIfYourPetGoesMissing,
    Assets.imagesFirstAidTips,
    Assets.imagesPetInsuranceInfo,
    Assets.imagesDailyActivityNeeds,
    Assets.imagesObedienceTrainingBasics,
  ];

//titles for tipsAndTricksCard
  List<String> headers = [];

  late bool isAdmin;

  @override
  void onInit() async {
    final loginController = Get.find<LoginControllerImp>();
    userType = loginController.user.type;
    isAdmin = loginController.isAdmin;
    userId = myServices.sharedPreferences.getInt("id")!;
    firstName = myServices.sharedPreferences.getString("name")!;
    await getRequest();
    Get.put(ViewMyRequestsControllerImp());
    //Get.delete<LoginControllerImp>();
    super.onInit();
  }

  @override
  goToAdoptAndHelp() {
    Get.toNamed("/adoptionandhelp");
  }

  @override
  goToAllRequests() {
    Get.toNamed("/myrequestspage");
  }

  @override
  goToChatBoot() {}

  @override
  goToChats() {}

  @override
  goToDoctors() {
    Get.toNamed("/mainbookpage");
  }

  @override
  goToNotifacation() {
    Get.toNamed("/notifactionpage");
  }

  @override
  goToSpecificReques() {}

  @override
  goTospecificTopiInTipsAndTricks(int index) {
    Get.toNamed("/informationpage", arguments: tipsAndTricksList[index]);
  }

  @override
  getHeaderInTipsAndTricks() {
    //for get header and details
    for (var i = 0; i < tipsAndTricksList.length; i++) {
      for (var map in TipsAndTricksForYourPetsPageData.informationTopics) {
        if (map.containsKey(tipsAndTricksList[i])) {
          final data = map[tipsAndTricksList[i]]!;
          headers.add(data.keys.first);

          break;
        }
      }
    }
  }

  @override
  getRequest() async {
    isLoading = true;
    update();

    adoptions.clear();
    helpRequests.clear();
    mergedItems.clear();

    var res = await HomeData().postData(userid: userId);

    if (res.containsKey('adoption') && res['adoption'] is List) {
      List adoptionList = res['adoption'];
      if (adoptionList.isNotEmpty) {
        adoptions.addAll(adoptionList.map((e) => AdoptionModel.fromJson(e)));
      }
    }

    if (res.containsKey('help') && res['help'] is List) {
      List helpList = res['help'];
      if (helpList.isNotEmpty) {
        helpRequests.addAll(helpList.map((e) => HelpRequestModel.fromJson(e)));
      }
    }

    hasRequests = adoptions.isNotEmpty || helpRequests.isNotEmpty;

    mergedItems = [
      ...adoptions.map((a) => UnifiedItem(data: a, type: 'adoption')),
      ...helpRequests.map((h) => UnifiedItem(data: h, type: 'help')),
    ];

    mergedItems.shuffle();

    isLoading = false;
    update();
  }
}

//this class for migrate two list with each other in adoptionModels and helpModels
class UnifiedItem {
  final dynamic data;
  final String type; // 'adoption' or 'help'

  UnifiedItem({required this.data, required this.type});
}
