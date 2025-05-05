import 'dart:typed_data';

import 'package:ecommerce_app_login/domain/db/database_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit(); // Initialize ffi

  setUp(() async {
    // Override sqflite to use ffi (in-memory DB for testing)
    databaseFactory = databaseFactoryFfi;
    // Force DB to reset
    // DBHelper._db = null;
  });

  test('User registration and login', () async {
    await DBHelper.registerUser('test@example.com', 'password123');
    final user = await DBHelper.login('test@example.com', 'password123');
    expect(user, isNotNull);
    expect(user!.email, equals('test@example.com'));
  });

  test('Profile creation, retrieval, and update', () async {
    const email = 'profile@example.com';

    await DBHelper.registerUser(email, 'pass');
    await DBHelper.createProfile(
      email: email,
      firstName: 'John',
      lastName: 'Doe',
      phone: '1234567890',
      address: 'Street 1',
      image: Uint8List.fromList([1, 2, 3]), // Dummy image
    );

    final profile = await DBHelper.getProfile(email);
    expect(profile, isNotNull);
    expect(profile!.firstName, equals('John'));

    // Update the profile
    await DBHelper.updateProfile(
      email: email,
      firstName: 'Jane',
      lastName: 'Smith',
      phone: '9876543210',
      address: 'Street 2',
      image: Uint8List.fromList([9, 8, 7]), // New dummy image
    );

    final updatedProfile = await DBHelper.getProfile(email);
    expect(updatedProfile, isNotNull);
    expect(updatedProfile!.firstName, equals('Jane'));
    expect(updatedProfile.image, equals(Uint8List.fromList([9, 8, 7])));
  });

  test('Check profileExists returns correct value', () async {
    const email = 'check@example.com';

    await DBHelper.registerUser(email, 'pass');
    final existsBefore = await DBHelper.profileExists(email);
    expect(existsBefore, isFalse);

    await DBHelper.createProfile(
      email: email,
      firstName: 'Check',
      lastName: 'Exist',
      phone: '0000000000',
      address: 'Nowhere',
    );

    final existsAfter = await DBHelper.profileExists(email);
    expect(existsAfter, isTrue);
  });
}
