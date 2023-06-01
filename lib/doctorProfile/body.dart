import 'package:flutter/material.dart';

import '../api.dart';
import '../colors.dart';
import '../components.dart';
import '../dataClass/dataClass.dart';

class body extends StatefulWidget {
  final doctorProfile profile;
  final List<String> data;
  const body({Key? key, required this.profile, required this.data}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height),
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: ListTile(
              leading: components().backButton(context),
              title: components().text(
                  widget.profile.name, FontWeight.bold, Colors.black, 25),
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(25),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4, blurStyle: BlurStyle.outer)],
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 15,
                      children: [
                        ClipOval(
                          child: CircleAvatar(
                            backgroundColor: Colors.black12,
                              radius: MediaQuery.of(context).size.width * 0.11,
                              child: Image(image: NetworkImage(api().uri+widget.profile.image!),)

                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            components().text(widget.profile.name, FontWeight.w700, Colors.black, 16),
                            SizedBox(height: 5,),
                            components().text(widget.profile.degree[0].name, FontWeight.w500, Colors.grey, 15),
                            SizedBox(height: 5,),
                            components().text(widget.profile.hospital, FontWeight.w500, Colors.grey, 15),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: colors().logo_darkBlue),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Wrap(
                      spacing: MediaQuery.of(context).size.width * 0.1,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Icon(Icons.people, color: colors().logo_darkBlue, size: 26),
                              padding: EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Color(0xff9FD6EE)
                              ),
                            ),
                            components().text(widget.data[0].toString()+"+", FontWeight.w600, colors().logo_darkBlue, 16),
                            components().text("Patients", FontWeight.normal, Colors.black, 16)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Icon(Icons.person_outline, color: colors().logo_darkBlue, size: 26),
                              padding: EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Color(0xff9FD6EE)
                              ),
                            ),
                            components().text(widget.profile.experience.toString() + "+", FontWeight.w600, colors().logo_darkBlue, 16),
                            components().text("Years of Experience", FontWeight.normal, Colors.black, 13)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Icon(Icons.message, color: colors().logo_darkBlue, size: 26),
                              padding: EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Color(0xff9FD6EE)
                              ),
                            ),
                            components().text(widget.data[1].toString()+"+", FontWeight.w600, colors().logo_darkBlue, 16),
                            components().text("Reviews", FontWeight.normal, Colors.black, 13)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        components().text("About Doctor", FontWeight.bold, Colors.grey, 20),
                        components().text(widget.profile.description, FontWeight.normal, Colors.black, 16)
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        components().text("Reviews", FontWeight.bold, Colors.grey, 20 ),
                        components().text("View Reviews", FontWeight.w600, colors().logo_darkBlue, 16)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
