import 'package:flutter/material.dart';

import '../api.dart';
import '../components.dart';
import '../dataClass/dataClass.dart';
import '../doctorProfile/doctorProfile.dart';

class body extends StatefulWidget {

  final List<doctorProfile> doctors;

  const body({Key? key, required this.doctors}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: ListTile(
                leading: components().backButton(context),
                title: components().text("Doctors", FontWeight.w500, Colors.black, 32),
              ),
            ),

          ),
          body:  ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.doctors.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                    margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Color(0xfff6f6f4),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.13,
                              margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image(image: NetworkImage(api().uri + widget.doctors[index].image!)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                components().text(widget.doctors[index].name, FontWeight.w500, Colors.black, 20),
                                components().text(widget.doctors[index].degree[0].name, FontWeight.normal, Colors.black, 20),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  child: components().text("ViewDetails", FontWeight.normal, Colors.blue, 16),
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => doctorProfie(profile: widget.doctors[index]),));
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    )),
                onTap: () {

                },
              );
            },
          )
      ),
    );
  }
}
