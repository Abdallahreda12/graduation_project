class UserInfoModel {
  String firstName;
  String lastName;
  String? gender;
  String emailAddress;
  String phoneNumber;
  String birthday;
  String ageRangeOfAnimal;

  String lookingForAdoption;
  String animalsAdoptionPreferred;
  String haveYouAdoptBefore;
  String haveExperienceWithAnimalCare;
  String turnOnNotification;
  String location;
  String? usersPhotoUrl;

  UserInfoModel({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.emailAddress,
    required this.phoneNumber,
    required this.birthday,
    required this.ageRangeOfAnimal,
    required this.lookingForAdoption,
    required this.animalsAdoptionPreferred,
    required this.haveYouAdoptBefore,
    required this.haveExperienceWithAnimalCare,
    required this.turnOnNotification,
    required this.location,
    required this.usersPhotoUrl,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      gender: json['gender'],
      emailAddress: json['email_address'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      birthday: json['birthday'] ?? '',
      ageRangeOfAnimal: json['age_range_of_animal'] ?? '',
      lookingForAdoption: json['looking_for_adoption'] ?? '',
      animalsAdoptionPreferred: json['animals_adoption_preferred'] ?? '',
      haveYouAdoptBefore: json['have_you_adopt_before'] ?? '',
      haveExperienceWithAnimalCare:
          json['have_experience_with_animal_care'] ?? '',
      turnOnNotification: json['turn_on_notification'] ?? '',
      location: json['location'] ?? '',
      usersPhotoUrl: "",
    );
  }
}
