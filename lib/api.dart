import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telemedicine_admin/addHospital/addHospital.dart';
import 'package:telemedicine_admin/dataClass/dataClass.dart';

import 'dataClass/dataClass.dart';

class api {
  String uri = 'http://192.168.1.15:5024/';

  Future<List<String>> login(String phone, String password) async {
    String url = uri + "api/users/login";
    var res = await http.post(Uri.parse(url),
        body: json.encode({
          "phone": phone,
          "password": password,
          "role": "Admin"
        }),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        encoding: Encoding.getByName('utf-8'));
    print(res.statusCode);

    var ack = json.decode(res.body);
    var a = ack.toString().split(",");
    print(a);
    if (a[0] == "First time") {
      return a;
    } else {
      return a;
    }

    // if (ack == "Valid") {
    //   return "Valid";
    // } else if (ack == "First time") {
    //   return "First time";
    // } else {
    //   return "Invalid";
    // }
  }

  Future<List<String>> profiledetails(String id) async {
    String url = "${uri}api/admin";
    var res = await http.get(Uri.parse(url));
    var responseData = json.decode(res.body);

    print(responseData[0]);
    List<String> data = [];

    for(var i in responseData){
      data.add(i["totalpatients"].toString());
      data.add(i["totaldoctors"].toString());
    }
    
    print(data);
    return data;
  }

  // Future<String> updateProfile(profile data, String id, ) async {
  //   print(data);
  //   var url = "api/doctors?id=" + id;
  //   var request = http.MultipartRequest('PUT', Uri.parse(uri + url));
  //
  //   request.fields.addAll({
  //     "user.name": data.name,
  //     "user.email": data.email,
  //     "user.gender": data.gender,
  //     "user.password": data.password,
  //     "speciality" : data.docData.speciality,
  //     "facility_id" : data.docData.hospital.toString(),
  //     "description" : data.docData.description,
  //     "experience" :  data.docData.experience.toString(),
  //     "tags" :  data.docData.tags,
  //     "fees":  data.docData.fees.toString()
  //   });
  //   if (data.image != null) {
  //     print("=============================="+data.image.toString());
  //     request.files
  //         .add(await http.MultipartFile.fromPath('user.image', data.image!));
  //   }
  //
  //   if(data.docData.degree.isNotEmpty){
  //     for (var i = 0; i < data.docData.degree.length; i++) {
  //       request.fields.addAll({
  //         "degree":  data.docData.degree[i].name,
  //       });
  //       request.files.add(await http.MultipartFile.fromPath(
  //           'document',  data.docData.degree[i].docPath));
  //     }
  //   }
  //   if(data.docData.otherAchievements.isNotEmpty){
  //     for (var i = 0; i <  data.docData.otherAchievements.length; i++) {
  //       request.fields.addAll({
  //         "otherachivement":  data.docData.otherAchievements[i].name,
  //       });
  //       request.files.add(await http.MultipartFile.fromPath(
  //           'otherachivementdoc',  data.docData.otherAchievements[i].docPath));
  //     }
  //   }
  //
  //
  //
  //   // print(request.statusCode);
  //   // print(request.body);
  //   var req = await request.send();
  //   print(req.statusCode);
  //   return "Success";
  // }
  //
  Future<String> createProfile(adminProfile data) async {
    print(data);
    var url = "api/admin?id=" + data.id.toString();
    var request = await http.put(Uri.parse(uri + url),
        body:json.encode({
          "email": data.email,
          "gender": data.gender,
          "dob": data.dob,
        }),
        headers: {
          "Accept": "application/json",
          "content-type":"application/json"
        },
        encoding: Encoding.getByName('utf-8'));


    // var response = await request.send();


    print(json.decode(request.body));

    return json.decode(request.body);
  }

  Future<String> addDoctor(doctor doctorData) async {

    var url = "api/users";
    var request = await http.post(Uri.parse(uri+url),
        body: json.encode({
          "name":doctorData.name,
          "phone": doctorData.phone,
          "password": doctorData.password
        }),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        encoding: Encoding.getByName('utf-8'));

    print(request.statusCode);
    return "Success";
  }

  Future<String> addHospital(hospital hospitalData) async {

    var url = "api/facilities";
    var request = await http.post(Uri.parse(uri+url),
        body: json.encode({
          "name":hospitalData.name,
          "phone": hospitalData.phone,
          "address": hospitalData.address,
          "email" : hospitalData.email
        }),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        encoding: Encoding.getByName('utf-8'));

    print(request.statusCode);
    return "Success";
  }

  Future<List<profile>> patientProfile() async {
    String url = uri + "api/admin/viewpatient";
    var res = await http.get(Uri.parse(url));
    var responseData = json.decode(res.body);

    print(responseData[0]);
    List<profile> profileData = [];

    for(var i in responseData){
      profileData.add(profile(
        id:null,
        password: null,
        name: i["name"].toString(),
        email: i["email"].toString(),
        gender: i["gender"].toString(),
        dob: i["dob"].toString(),
        image: i["image"].toString(),
        phone: i["phone"].toString(),
      ));
    }

    print(profileData);
    return profileData;
  }


  Future<List<String>> getDocData(String id) async {
    var url = "api/doctors/drview?id=" + id;
    var res = await http.get(Uri.parse(uri + url));
    var response = json.decode(res.body);
    List<String> data = [];
    data.add(response[0]["totalpatients"].toString());
    data.add(response[0]["review"].toString());
    return data;
  }

  Future<List<doctorProfile>> doctorprofile() async {
    String url = uri + "api/admin/viewdoctor";
    var res = await http.get(Uri.parse(url));
    var responseData = json.decode(res.body);

    print(responseData[0]);
    List<doctorProfile> profileData = [];

    for(var i in responseData){
      profileData.add(doctorProfile(

        id: i["user"]["id"].toString(),
        name: i["user"]["name"].toString(),
        email: i["user"]["email"].toString(),
        gender: i["user"]["gender"].toString(),
        dob: i["user"]["dob"].toString(),
        image: i["user"]["image"].toString(),
        phone: i["user"]["phone"].toString(),
        speciality: i["speciality"].toString(),
        fees: i["fees"],
        description: i["description"],
        experience: i["experience"],
        tags: i["tags"],
        degree: [docs(name: i["degree"].toString(), docPath: i["document"])],
        otherAchievements: [docs(name: i["otherachivement"], docPath: i["otherachivementdoc"])],
        hospital: i["facility"]
      ));
    }

    // print(profileData);
    return profileData;
  }

}
