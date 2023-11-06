import 'package:equatable/equatable.dart';

class RandomUser extends Equatable {
  final String name;
  final String prefixName;
  final String firstName;
  final String lastName;
  final String street;
  final String city;
  final String country;
  final String postcode;
  final String description;
  final String email;
  final String username;
  final String phone;
  final String dob;
  final String image;
  final String? error;

  const RandomUser.empty(String? error)
      : this(
          name: '',
          prefixName: '',
          firstName: '',
          lastName: '',
          street: '',
          city: '',
          country: '',
          postcode: '',
          description: '',
          email: '',
          username: '',
          phone: '',
          dob: '',
          image: '',
          error: error ?? '',
        );

  const RandomUser({
    required this.name,
    required this.prefixName,
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.city,
    required this.country,
    required this.postcode,
    required this.description,
    required this.email,
    required this.username,
    required this.phone,
    required this.dob,
    required this.image,
    this.error,
  });

  @override
  List<Object?> get props => [];
}
