class AdoptionModel {
  final int adoptionId;
  final int userId;
  final String title;
  final String type;
  final String gender;
  final String size;
  final int age;
  final String location;
  final String description;
  final String photoUrl;
  final String phone;
  final String createdAt;
  final String updatedAt;

  AdoptionModel({
    required this.adoptionId,
    required this.userId,
    required this.title,
    required this.type,
    required this.gender,
    required this.size,
    required this.age,
    required this.location,
    required this.description,
    required this.photoUrl,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdoptionModel.fromJson(Map<String, dynamic> json) {
    return AdoptionModel(
      adoptionId: json['adoption_id'],
      userId: json['adoption_listings_user_id'],
      title: json['adoption_listings_title'],
      type: json['adoption_listings_type'],
      gender: json['adoption_listings_gender'],
      size: json['adoption_listings_size'],
      age: json['adoption_listings_age'],
      location: json['adoption_listings_location'],
      description: json['adoption_listings_description'],
      photoUrl: json['adoption_listings_photo_url'],
      phone: json['adoption_listings_phone'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adoption_id': adoptionId,
      'adoption_listings_user_id': userId,
      'adoption_listings_title': title,
      'adoption_listings_type': type,
      'adoption_listings_gender': gender,
      'adoption_listings_size': size,
      'adoption_listings_age': age,
      'adoption_listings_location': location,
      'adoption_listings_description': description,
      'adoption_listings_photo_url': photoUrl,
      'adoption_listings_phone': phone,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
