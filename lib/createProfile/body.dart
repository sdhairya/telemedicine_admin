import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine_admin/api.dart';
import 'package:telemedicine_admin/dashboardScreen/dashboardScreen.dart';

import '../colors.dart';
import '../components.dart';
import '../dataClass/dataClass.dart';

class body extends StatefulWidget {

  final String id;
  const body({Key? key, required this.id}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {

  DateTime dateTime = DateTime.now();
  String? gender;
  String dropdownvalue = 'Choose Hospital';
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  bool emailInvalid = false;
  bool _genderInvalid = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                ListTile(
                  leading: components().backButton(context),
                  title: components().text("Create Profile", FontWeight.w500, Color(0xff101010), 26),
                ),
                SizedBox(
                  height: 10,
                ),
                components().text("   Email", FontWeight.w500, Colors.black, 18),
                components().textField("Enter email", TextInputType.text, _emailController),
                emailInvalid ? components().text(" Enter valid Email", FontWeight.normal, Colors.red, 15) : Container(),
                SizedBox(
                  height: 15,
                ),
                // components().text("   Phone", FontWeight.w500, Colors.black, 18),
                // components().textField("Enter Phone", TextInputType.phone, _phoneController),
                // emailInvalid ? components().text(" Enter valid Phone", FontWeight.normal, Colors.red, 15) : Container(),
                // SizedBox(
                //   height: 15,
                // ),
                components().text("   Gender", FontWeight.w500, Colors.black, 18),
                Container(
                  height:
                  MediaQuery.of(context).size.height * 0.07,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xfff6f4f4),
                      border:
                      Border.all(color: Color(0xffd7d7d7)),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: "male",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = "male";
                            _genderInvalid = false;
                          });
                        },
                      ),
                      components().text("Male", FontWeight.w500,
                          Color(0xff292929), 16),
                      Radio(
                        value: "female",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = "female";
                            _genderInvalid = false;
                          });
                        },
                      ),
                      components().text(
                          "Female",
                          FontWeight.w500,
                          Color(0xff292929),
                          16),
                      Radio(
                        value: "other",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = "other";
                            _genderInvalid = false;
                          });
                        },
                      ),
                      components().text(
                          "Other",
                          FontWeight.w500,
                          Color(0xff292929),
                          16),
                    ],
                  ),
                ),
                _genderInvalid ? components().text(" Please Select Gender", FontWeight.normal, Colors.red, 15) : Container(),
                SizedBox(
                  height: 15,
                ),
                components().text("   Date of Birth", FontWeight.w500, Colors.black, 18),
                InkWell(
                  onTap: () => showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      actions: [
                        buildDatePicker(),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: Text('Done'),
                        onPressed: () {
                          final value = dateTime;
                          print(value);
                          setState(() {
                            dateTime = value;
                            Navigator.of(context).pop();
                          });


                        },
                      ),
                    ),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: Color(0xfff6f4f4),
                        border: Border.all(color: Color(0xffd7d7d7)),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        components().text(dateTime.toString().substring(0,10), FontWeight.normal, Colors.black, 18),
                        Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey,)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
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
                        _validate();
                        setState(() {
                          isLoading = true;
                        });
                        var res = await api().createProfile(adminProfile(id: widget.id, email: _emailController.text, gender: gender.toString(), dob: dateTime.toString().substring(0,10)));

                        if(res == "Success"){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => dashboardScreen(id: widget.id),));
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: components().text("Profile not created", FontWeight.w500, Colors.white, 18)));
                        }
                        setState(() {
                          isLoading = false;
                        });
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => scheduleslots(id:  widget.id, hospitalId: hostiptaId),));
                      },
                      child: isLoading ? CircularProgressIndicator(color: Colors.white,) : components().text("Submit",
                          FontWeight.bold, Colors.white, 20)),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  _validate() {

    if(_emailController.text.isEmpty){
      setState(() {
        emailInvalid = true;
      });
    }
    if(gender == "female"){
      setState(() {
        _genderInvalid = false;
      });
    }
    if(gender == "male"){
      setState(() {
        _genderInvalid = false;
      });
    }
    if(gender == "other"){
      setState(() {
        _genderInvalid = false;
      });
    }



  }


  Widget buildDatePicker() => SizedBox(
    height: 180,
    child: CupertinoDatePicker(
      minimumYear: 2015,
      maximumYear: DateTime.now().year,
      initialDateTime: dateTime,
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (dateTime) =>
          setState(() => this.dateTime = dateTime),
    ),
  );


}
