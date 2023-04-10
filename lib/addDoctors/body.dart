import 'package:flutter/material.dart';
import 'package:telemedicine_admin/api.dart';
import 'package:telemedicine_admin/dataClass/dataClass.dart';

import '../colors.dart';
import '../components.dart';

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();


  bool nameInvalid = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: ListTile(
              leading: components().backButton(context),
            ),
          ),

        ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),

                  components().text("Add Doctor", FontWeight.bold, Color(0xff101010), 40),


                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  components().text("   Name", FontWeight.w500, Colors.black, 18),
                  components().textField("Enter Name", TextInputType.text, _nameController),
                  // emailInvalid ? components().text(" Enter valid Name", FontWeight.normal, Colors.red, 15) : Container(),
                  SizedBox(
                    height: 15,
                  ),
                  components().text("   Phone", FontWeight.w500, Colors.black, 18),
                  components().textField("Enter Phone", TextInputType.phone, _phoneController),
                  // emailInvalid ? components().text(" Enter valid Phone", FontWeight.normal, Colors.red, 15) : Container(),
                  SizedBox(
                    height: 15,
                  ),
                  components().text("   Password", FontWeight.w500, Colors.black, 18),
                  components().textField("Enter Password", TextInputType.text, _passwordController),
                  SizedBox(
                    height: 15,
                  ),
                  components().text("   Confirm Password", FontWeight.w500, Colors.black, 18),
                  components().textField("ReEnter Password", TextInputType.text, _confirmPasswordController),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colors().logo_darkBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(15)),
                            padding: EdgeInsets.fromLTRB(
                                55, 10, 55, 10)
                        ),
                        onPressed: () async {
                          // _validate();
                          setState(() {
                            isLoading = true;
                          });
                          await api().addDoctor(doctor(name: _nameController.text, phone: _phoneController.text, password: _passwordController.text));
                          setState(() {
                            isLoading = false;
                          });
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => scheduleslots(id:  widget.id, hospitalId: hostiptaId),));
                        },
                        child: isLoading ? CircularProgressIndicator(color: Colors.white,) : components().text("Add Doctor",
                            FontWeight.bold, Colors.white, 20)),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
