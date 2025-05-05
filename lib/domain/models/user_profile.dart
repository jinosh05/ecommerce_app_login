import 'dart:typed_data';

class UserProfile {

  UserProfile({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
    this.image, // Optional image field
  });

  factory UserProfile.fromMap(final Map<String, dynamic> map) => UserProfile(
      email: map['email'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      phone: map['phone'],
      address: map['address'],
      image: map['image'], // Assuming it's a BLOB
    );
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;
  final Uint8List? image;

  Map<String, dynamic> toMap() => {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'address': address,
      'image': image, // Store image as BLOB
    };
}
