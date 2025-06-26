import 'package:get/get.dart';
import 'package:graduation_project/controller/loginController.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/data/models/userInfo.dart';
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
}

class HomePageControllerImp extends HomePageController {
  late UserModel user;
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

  @override
  void onInit() {
    final LoginControllerImp loginController = Get.find();
    user = loginController.user;
    Get.delete<LoginControllerImp>();
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
}
