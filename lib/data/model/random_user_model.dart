import 'package:flutter_rxdart/domain/entities/random_user.dart';

class RandomUserModel extends RandomUser {
  const RandomUserModel(
      {required super.name,
      required super.prefixName,
      required super.firstName,
      required super.lastName,
      required super.street,
      required super.city,
      required super.country,
      required super.postcode,
      required super.description,
      required super.email,
      required super.username,
      required super.phone,
      required super.dob,
      required super.image,
      super.error});

  factory RandomUserModel.fromMap(Map<String, dynamic> map) {
    return RandomUserModel(
      name: map['name']['first'] as String,
      prefixName: map['name']['title'] as String,
      firstName: map['name']['first'] as String,
      lastName: map['name']['last'] as String,
      street: map['location']['street']['name'] as String,
      city: map['location']['city'] as String,
      country: map['location']['country'] as String,
      postcode: map['location']['postcode'].toString(),
      description: map['location']['timezone']['description'] as String,
      email: map['email'] as String,
      username: map['login']['username'] as String,
      phone: map['phone'] as String,
      dob: map['dob']['age'].toString(),
      image: map['picture']['large'] as String,
    );
  }
}
