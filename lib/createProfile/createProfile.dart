import 'package:flutter/material.dart';
import 'package:telemedicine_admin/api.dart';

import 'body.dart';

class createProfile extends StatefulWidget {

  final String id;
  const createProfile({Key? key, required this.id}) : super(key: key);

  @override
  State<createProfile> createState() => _createProfileState();
}

class _createProfileState extends State<createProfile> {
  @override
  Widget build(BuildContext context) {
    // return body(hospitals: []);
    return body(id:  widget.id,);

  }
}
