class UserStatesModel {
  final String id;
  final bool states;

  UserStatesModel({required this.id, required this.states});

  // Convert a Account into a Map. The keys must correspond to the names of the attributes.
  Map<String, dynamic> toJson() => {
        'id': id,
        'status': states,
      };

  // Convert a Map into a Account
  factory UserStatesModel.fromJson(String userId , String states) {
    return UserStatesModel(
      id: userId,
      states: states == "online" ? true : false,
    );
  }
}