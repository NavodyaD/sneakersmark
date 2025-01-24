class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String image;
  final String email;
  final int gender;

  UserModel({
    required this.userId, 
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.email,
    required this.gender,
  });
}