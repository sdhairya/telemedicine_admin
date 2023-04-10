import 'dart:core';

import 'dataClass.dart';

class profile{

  String? id = "";
  String name = "";
  String email = "";
  String gender = "";
  String? password = "";
  String dob = "";
  String? image = "";
  String phone = "";

  profile(
      {required this.id, required this.name, required this.email, required this.gender, required this.password,required this.dob, required this.image, required this.phone});

  @override
  String toString() {
    return "$name\n$email\n$gender\n$password\n$image\n$dob\n$phone\n$id";
  }

}

class doctor{

  String name = "";
  String phone = "";
  String password = "";


  doctor({
    required this.name, required this.phone, required this.password
  });

  @override
  String toString() {
    return "$name\n$phone\n$password";
  }
}

class hospital{

  String name = "";
  String address = "";
  String phone = "";
  String email = "";

  hospital({
    required this.email, required this.name, required this.address, required this.phone
});

  @override
  String toString() {
    return "$email\n$name\n$address\n$phone";
  }
}

class doctorProfile{

  String id = "";
  String name = "";
  String email = "";
  String gender = "";
  String dob = "";
  String? image = "";
  String phone = "";
  String speciality = "";
  String hospital = "";
  List<docs> degree = [];
  List<docs> otherAchievements = [];
  String description = "";
  String tags = "";
  int experience = 0;
  int fees = 0;

  doctorProfile(
      {required this.id, required this.name, required this.email, required this.gender,required this.dob, required this.image, required this.phone,
        required this.hospital, required this.description, required this.experience, required this.degree, required this.otherAchievements, required this.fees, required this.tags, required this.speciality
      });

  @override
  String toString() {
    return "$name\n$email\n$gender\n$image\n$dob\n$phone";
  }

}

class docs{

  String name = "";
  String docPath = "";

  docs({
    required this.name, required this.docPath
  });

  @override
  String toString() {
    return "$name\n$docPath";
  }
}


