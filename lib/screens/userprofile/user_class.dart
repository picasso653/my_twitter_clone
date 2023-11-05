import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String uid; // Unique User ID
  final String email;
  final String username; // Default to email without domain
  final String firstName; // New property
  final String lastName; // New property
  final DateTime dateOfBirth; // New property
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

  // Factory constructor to create a User object from Firebase User
  factory User.fromFirebaseUser(UserCredential userCredential) {
    UserCredential userCredential = FirebaseAuth.instance.currentUser! as UserCredential;
    User user = userCredential.user! as User;

    return User(
      uid: user.uid,
      email: user.email,
      username: user.email.split('@')[0], // Default username
      firstName: '', // Default to empty string
      lastName: '', // Default to empty string
      dateOfBirth: DateTime(2000, 1, 1), // Default date of birth
      phoneNumber: '', // Default to empty string
      profilePictureUrl: 'path_to_default_image', // Default profile picture URL
    );
  }
}
