import 'package:flutter/material.dart';

import '../api.dart';
import '../colors.dart';
import '../components.dart';
import '../dataClass/dataClass.dart';

class body extends StatefulWidget {

  final List<profile> patients;

  const body({Key? key, required this.patients}) : super(key: key);

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
                title: components().text("Patients", FontWeight.w500, Colors.black, 32),
              ),
            ),

          ),
          body: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.patients.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 15),
                    margin: const EdgeInsets.only(top: 5, bottom: 5, left: 10,right: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xfff6f6f4),
                        borderRadius:
                        BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: MediaQuery.of(context).size.width * 0.2,
                              width: MediaQuery.of(context).size.width * 0.2,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white70),
                              child: CircleAvatar(
                                  radius: MediaQuery.of(context).size.width * 0.17,
                                  child: ClipOval(
                                      child: widget.patients[index].image! == ""
                                          ? const Icon(Icons.person,color: Color(0xff343430),size: 30)
                                          : Image.network(api().uri + widget.patients[index].image!, fit: BoxFit.fill, height: double.infinity, width: double.infinity,)
                                  ),

                              ),

                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const components().text(widget.patients[index].name, FontWeight.w500, Colors.black, 16),
                                const components().text(widget.patients[index].phone, FontWeight.w400, Color(0xff474747), 14),

                                InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffBDEAF8),
                                    ),
                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),

                                    child: Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      children: [
                                        Icon(Icons.remove_red_eye_outlined, color: colors().logo_darkBlue, size: 17),
                                        const components().text("View", FontWeight.normal, colors().logo_darkBlue, 14)
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    showDialog(context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          contentPadding: const EdgeInsets.all(15),
                                          content: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ListTile(
                                                dense: true,
                                                leading: const components().text("Patient Details", FontWeight.w500, Color(0xff676767), 22),
                                                trailing: const Icon(Icons.cancel_outlined),
                                              ),
                                              const Divider(),
                                              Wrap(
                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                spacing: 20,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.bottomCenter,
                                                    height: MediaQuery.of(context).size.width * 0.2,
                                                    width: MediaQuery.of(context).size.width * 0.2,
                                                    decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white70),
                                                    child: CircleAvatar(
                                                        radius: MediaQuery.of(context).size.width * 0.17,
                                                        child: widget.patients[index].image! == ""
                                                            ? const Icon(Icons.person,color: Color(0xff343430),size: 30)
                                                            : Image.network(api().uri + widget.patients[index].image!)
                                                    ),

                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const components().text(widget.patients[index].name!, FontWeight.bold, Color(0xff696969), 20),
                                                      // const components().text("Phone", FontWeight.normal, Color(0xff101010), 18),
                                                      const components().text(widget.patients[index].phone, FontWeight.normal, Color(0xff696969), 18),
                                                    ],
                                                  )
                                                ],
                                              ),

                                              Container(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const components().text("Email :", FontWeight.normal, Color(0xff101010), 18),
                                                    const components().text(widget.patients[index].email, FontWeight.normal, Color(0xff696969), 18),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),

                                                    const components().text("Date of Birth :", FontWeight.normal, Color(0xff101010), 18),
                                                    const components().text(widget.patients[index].dob.substring(0,10), FontWeight.normal, Color(0xff696969), 18),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const components().text("Gender :", FontWeight.normal, Color(0xff101010), 18),
                                                    const components().text(widget.patients[index].gender, FontWeight.normal, Color(0xff696969), 18),

                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),

                                        );
                                      },
                                    );
                                  },
                                )
                                ,

                              ],
                            ),


                          ],
                        ),
                      ],
                    )
                ),
                onTap: () {

                },
              );
            },
          ),
      ),
    );
  }
}
