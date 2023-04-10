import 'package:flutter/material.dart';

import '../api.dart';
import 'package:telemedicine_admin/viewDoctors/body.dart';

class viewDoctors extends StatelessWidget {
  const viewDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api().doctorprofile(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if(snapshot.hasData){
          return body(doctors: snapshot.data!,);
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
