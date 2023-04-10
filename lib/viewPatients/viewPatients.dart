import 'package:flutter/material.dart';
import 'package:telemedicine_admin/api.dart';
import 'package:telemedicine_admin/viewPatients/body.dart';

class viewPatients extends StatelessWidget {
  const viewPatients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api().patientProfile(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if(snapshot.hasData){
          return body(patients: snapshot.data!,);
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
