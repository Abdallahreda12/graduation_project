class HelpRequestModel {
  final int helpId;
  final int userId;
  final String title;
  final String date;
  final String phone;
  final String location;
  final String description;
  final String photoUrl;
  final String socialMediaLink;
  final String createdAt;
  final String updatedAt;

  HelpRequestModel({
    required this.helpId,
    required this.userId,
    required this.title,
    required this.date,
    required this.phone,
    required this.location,
    required this.description,
    required this.photoUrl,
    required this.socialMediaLink,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HelpRequestModel.fromJson(Map<String, dynamic> json) {
    return HelpRequestModel(
      helpId: json['help_id'],
      userId: json['help_requests_user_id'],
      title: json['help_requests_title'],
      date: json['help_requests_date'],
      phone: json['help_requests_phone'],
      location: json['help_requests_location'],
      description: json['help_requests_description'],
      photoUrl: json['help_requests_photo_url'],
      socialMediaLink: json['help_requests_social_media_link'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'help_id': helpId,
      'help_requests_user_id': userId,
      'help_requests_title': title,
      'help_requests_date': date,
      'help_requests_phone': phone,
      'help_requests_location': location,
      'help_requests_description': description,
      'help_requests_photo_url': photoUrl,
      'help_requests_social_media_link': socialMediaLink,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
