// user_info_model.dart
class UserInfoModel {
  String firstName;
  String lastName;
  String? gender;
  String emailAddress;
  String phoneNumber;
  String birthday;
  String ageRangeOfAnimal;
  String areYouHelper;
  String lookingForAdoption;
  String animalsAdoptionPreferred;
  String haveYouAdoptBefore;
  String haveExperienceWithAnimalCare;
  String turnOnNotification;
  String location;

  UserInfoModel({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.emailAddress,
    required this.phoneNumber,
    required this.birthday,
    required this.ageRangeOfAnimal,
    required this.areYouHelper,
    required this.lookingForAdoption,
    required this.animalsAdoptionPreferred,
    required this.haveYouAdoptBefore,
    required this.haveExperienceWithAnimalCare,
    required this.turnOnNotification,
    required this.location,
  });
}
