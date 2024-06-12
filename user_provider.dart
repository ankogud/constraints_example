import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String firstName = '';
  String middleName = '';
  String lastName = '';
  String gender = '';
  String email = '';
  String phoneNumber = '';
  String countryOfBirth = '';

  void setUserData({
    required String firstName,
    required String middleName,
    required String lastName,
    required String gender,
    required String email,
    required String phoneNumber,
    required String countryOfBirth,
  }) {
    this.firstName = firstName;
    this.middleName = middleName;
    this.lastName = lastName;
    this.gender = gender;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.countryOfBirth = countryOfBirth;
    notifyListeners();
  }
}
