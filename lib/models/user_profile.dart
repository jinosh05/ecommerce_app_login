class UserProfile {
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;

  UserProfile({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
  });

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      email: map['email'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      phone: map['phone'],
      address: map['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'address': address,
    };
  }
}
