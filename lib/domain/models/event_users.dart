import 'dart:convert';

List<EventUsersModel> eventUsersModelFromJson(final String str) =>
    List<EventUsersModel>.from(
      json.decode(str).map((final x) => EventUsersModel.fromJson(x)),
    );

class EventUsersModel {
  EventUsersModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory EventUsersModel.fromJson(final Map<String, dynamic> json) =>
      EventUsersModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        address: Address.fromJson(json['address']),
        phone: json['phone'],
        website: json['website'],
        company: Company.fromJson(json['company']),
      );
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(final Map<String, dynamic> json) => Address(
    street: json['street'],
    suite: json['suite'],
    city: json['city'],
    zipcode: json['zipcode'],
    geo: Geo.fromJson(json['geo']),
  );
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;
}

class Geo {
  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(final Map<String, dynamic> json) =>
      Geo(lat: json['lat'], lng: json['lng']);
  final String lat;
  final String lng;
}

class Company {
  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(final Map<String, dynamic> json) => Company(
    name: json['name'],
    catchPhrase: json['catchPhrase'],
    bs: json['bs'],
  );
  final String name;
  final String catchPhrase;
  final String bs;
}
