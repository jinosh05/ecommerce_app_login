import 'dart:typed_data';

import 'package:ecommerce_app_login/domain/models/user_model.dart';
import 'package:ecommerce_app_login/domain/models/user_profile.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static Database? _db;

  static const String _userTable = 'users';
  static const String _profileTable = 'profiles';

  /// Initialize or get existing DB instance
  static Future<Database> get _database async {
    _db ??= await _initDB();
    return _db!;
  }

  /// Initialize the database with required tables
  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (final db, final version) async {
        await db.execute('''
          CREATE TABLE $_userTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL
          )
        ''');

        await db.execute('''
  CREATE TABLE $_profileTable (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT NOT NULL UNIQUE,
    first_name TEXT,
    last_name TEXT,
    phone TEXT,
    address TEXT,
    image BLOB
  )
''');
      },
    );
  }

  // -----------------------------------------------
  // 👤 USER LOGIN METHODS
  // -----------------------------------------------

  /// Log in user with email and password
  static Future<UserModel?> login(
    final String email,
    final String password,
  ) async {
    final db = await _database;
    final result = await db.query(
      _userTable,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return UserModel.fromJson(result.first);
    }
    return null;
  }

  /// Register new user (email + password)
  static Future<void> registerUser(
    final String email,
    final String password,
  ) async {
    final db = await _database;
    await db.insert(
      _userTable,
      {'email': email, 'password': password},
      conflictAlgorithm: ConflictAlgorithm.ignore, // prevent duplicates
    );
  }

  // -----------------------------------------------
  // 👤 PROFILE METHODS
  // -----------------------------------------------

  /// Check if profile exists for the given email
  static Future<bool> profileExists(final String email) async {
    final db = await _database;
    final result = await db.query(
      _profileTable,
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  /// Create a profile for a user
  static Future<void> createProfile({
    required final String email,
    required final String firstName,
    required final String lastName,
    required final String phone,
    required final String address,
    final Uint8List? image,
  }) async {
    final db = await _database;
    await db.insert(_profileTable, {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'address': address,
      'image': image,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Fetch profile data (optional helper)
  static Future<UserProfile?> getProfile(final String email) async {
    final db = await _database;
    final result = await db.query(
      _profileTable,
      where: 'email = ?',
      whereArgs: [email],
    );
    if (result.isNotEmpty) {
      return UserProfile.fromMap(result.first);
    }
    return null;
  }

  static Future<UserModel?> getUserByEmail(final String email) async {
    final db = await _database;
    final result = await db.query(
      _userTable,
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty ? UserModel.fromJson(result.first) : null;
  }

  /// Update an existing user profile
  static Future<void> updateProfile({
    required final String email,
    required final String firstName,
    required final String lastName,
    required final String phone,
    required final String address,
    final Uint8List? image,
  }) async {
    final db = await _database;

    await db.update(
      _profileTable,
      {
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
        'address': address,
        'image': image,
      },
      where: 'email = ?',
      whereArgs: [email],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
