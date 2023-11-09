
class User {
  final String uid; // Unique User ID
  final String email;
  final String username; // Default to email without domain
  final String firstName; // New property
  final String lastName; // New property
  final String dateOfBirth; // New property
  final String phoneNumber; // New property
  final String profilePictureUrl; // Default to a common profile picture

  User({
    required this.uid,
    required this.email,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.profilePictureUrl,
  });

  Map<String, dynamic> toJson()=>{
    'uid': uid,
    'email': email,
    'username': username,
    'firstname': firstName,
    'lastname': lastName,
    'DoB': dateOfBirth,
    'phone': phoneNumber,
    'profilepicture': profilePictureUrl,
  };
  }

