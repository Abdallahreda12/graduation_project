class AdditionalInfoModel {
  final int interestId;
  final int userId;
  final String adoptionPreference;
  final bool lookingForAdoption;
  final bool adoptedBefore;
  final String preferredAgeRange;
  final int hasExperienceCaring;
  final DateTime createdAt;
  final DateTime updatedAt;

  AdditionalInfoModel({
    required this.interestId,
    required this.userId,
    required this.adoptionPreference,
    required this.lookingForAdoption,
    required this.adoptedBefore,
    required this.preferredAgeRange,
    required this.hasExperienceCaring,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdditionalInfoModel.fromJson(Map<String, dynamic> json) {
    return AdditionalInfoModel(
      interestId: json['interest_id'],
      userId: json['user_interests_user_id'],
      adoptionPreference: json['user_interests_adoption_preference'],
      lookingForAdoption: json['user_interests_looking_for_adoption'] == 1,
      adoptedBefore: json['user_interests_adopted_before'] == 1,
      preferredAgeRange: json['user_interests_preferred_age_range'],
      hasExperienceCaring: json['user_interests_has_experience_caring'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'interest_id': interestId,
      'user_interests_user_id': userId,
      'user_interests_adoption_preference': adoptionPreference,
      'user_interests_looking_for_adoption': lookingForAdoption ? 1 : 0,
      'user_interests_adopted_before': adoptedBefore ? 1 : 0,
      'user_interests_preferred_age_range': preferredAgeRange,
      'user_interests_has_experience_caring': hasExperienceCaring,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
