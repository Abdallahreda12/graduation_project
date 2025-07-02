import 'package:get/get.dart';
import 'package:graduation_project/controller/HomePageController.dart';
import 'package:graduation_project/controller/loginController.dart';
import 'package:graduation_project/data/models/adoptionModel.dart';
import 'package:graduation_project/data/models/helpModel.dart';
import 'package:graduation_project/data/models/userInfo.dart';
import 'package:graduation_project/data/services/viewMyRequestsData.dart';

abstract class ViewMyRequestsController extends GetxController {
  getRequest();
}

class ViewMyRequestsControllerImp extends ViewMyRequestsController {
  late int userId;

  bool isLoading = false;
  late UserModel user;
  final List<AdoptionModel> adoptions = [];
  final List<HelpRequestModel> helpRequests = [];
  List<UnifiedItem> mergedItems = [];

  @override
  void onInit() async {
    final LoginControllerImp loginController = Get.find();
    user = loginController.user;
    userId = user.userId;
    await getRequest();
    // Get.delete<LoginControllerImp>();
    super.onInit();
  }

//get my requests
  @override
  getRequest() async {
    isLoading = true;
    update();
    var res = await ViewMyRequestsData().postData(userid: userId);

    if (res.containsKey('adoption') && res['adoption'] is List) {
      adoptions.addAll(
        (res['adoption'] as List).map((e) => AdoptionModel.fromJson(e)),
      );
    }

    if (res.containsKey('help') && res['help'] is List) {
      helpRequests.addAll(
        (res['help'] as List).map((e) => HelpRequestModel.fromJson(e)),
      );
    }
    print(adoptions[0].description);
    print(helpRequests[0].description);

    // Merge into one list
    mergedItems = [
      ...adoptions.map((a) => UnifiedItem(data: a, type: 'adoption')),
      ...helpRequests.map((h) => UnifiedItem(data: h, type: 'help')),
    ];

    // Shuffle randomly
    mergedItems.shuffle();
    isLoading = false;
    update();
  }
}
