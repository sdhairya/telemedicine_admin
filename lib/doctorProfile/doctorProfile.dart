import 'package:flutter/material.dart';

import '../api.dart';
import '../dataClass/dataClass.dart';
import 'package:telemedicine_admin/doctorProfile/body.dart';
class doctorProfie extends StatelessWidget {
  final doctorProfile profile;
  const doctorProfie({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: api().getDocData(profile.id),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return body(profile: profile, data: snapshot.data!,);
        }
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );


  }
}
