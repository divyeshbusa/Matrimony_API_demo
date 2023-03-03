import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:final_matrimony/Componets/my_textfield.dart';
import 'package:final_matrimony/Models/city_model.dart';
import 'package:final_matrimony/Models/gender_model.dart';
import 'package:final_matrimony/Models/user_list_model.dart';
import 'package:final_matrimony/api/User.dart';
import 'package:final_matrimony/api/remote_service.dart';
import 'package:final_matrimony/database/database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddUser extends StatefulWidget {
  late User? model;

  AddUser({required this.model});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool isValid = true;
  CityModel modelC = CityModel(CityID1: -1, CityName1: 'Select City');
  UserModel modelU = UserModel(
      UserName1: 'Enter Name:',
      PhoneNo1: 000000,
      Cityid1: 0,
      Photo1: '',
      GenderID1: 0,
      IsFavourite1: false,
      DOB1: 'Select DOB');
  GenderModel modelG = GenderModel(GenderID1: 0, GenderType1: 'male');
  bool isGetCity = true;
  bool isGetGender = true;
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  MyDatabase myDatabase = MyDatabase();
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController cityController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
        text: widget.model != null ? widget.model!.userName.toString() : '');

    phoneController = TextEditingController(
        text: widget.model != null ? widget.model!.phone.toString() : '');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.pink,
          ),
          backgroundColor: Colors.white,
          elevation: 10,
          shape: const ContinuousRectangleBorder(
            side: BorderSide(
                color: Colors.black, strokeAlign: StrokeAlign.outside),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(100),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 45),
                    child: Text(
                      'Add User',
                      style: GoogleFonts.montserratAlternates(
                          color: Colors.pink,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.pinkAccent,
                  Colors.pinkAccent.shade700,
                  Colors.pinkAccent.shade400,
                  Colors.pink,
                  Colors.pink.shade400,
                  Colors.pink.shade300,
                  Colors.pink.shade200,
                  Colors.pink.shade100,
                  Colors.purple.shade100,
                  Colors.purple.shade200,
                  Colors.purple.shade300,
                  Colors.purple.shade400,
                  Colors.purple,
                  Colors.purpleAccent.shade400,
                  Colors.purpleAccent.shade700,
                  Colors.purpleAccent
                ],
                center: Alignment.topRight,
                radius: 2.5,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: FutureBuilder<List<CityModel>>(
                      builder: (context, snapshot) {
                        if (snapshot.data != null || snapshot.hasData) {
                          if (isGetCity) {
                            modelC = snapshot.data![0];
                          }

                          return DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              items: snapshot.data!
                                  .map((item) => DropdownMenuItem<CityModel?>(
                                        value: item,
                                        child: Text(
                                          item.CityName.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: modelC,
                              onChanged: (value) {
                                setState(() {
                                  isGetCity = false;
                                  modelC = value!;
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 20,
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: Colors.black),
                                color: Colors.white60,
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                      future:
                          isGetCity ? myDatabase.getCityListFromTbl() : null,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(children: [
                      Text(
                        'Name : ',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(width: 35),
                      Expanded(
                        child: MyTextField(
                            controller: nameController,
                            hintText: " ",
                            obscureText: false,
                            onChange: (value) {}),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(children: [
                      Text(
                        'Phone No : ',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Expanded(
                        child: MyTextField(
                            controller: phoneController,
                            hintText: " ",
                            obscureText: false,
                            onChange: (value) {}),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: FutureBuilder<List<GenderModel>>(
                          builder: (context, snapshot) {
                            if (snapshot.data != null || snapshot.hasData) {
                              if (isGetGender) {
                                modelG = snapshot.data![0];
                              }

                              return DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  items: snapshot.data!
                                      .map((item) =>
                                          DropdownMenuItem<GenderModel?>(
                                            value: item,
                                            child: Text(
                                              item.GenderType.toString(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: modelG,
                                  onChanged: (value) {
                                    setState(() {
                                      isGetGender = false;
                                      modelG = value!;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                  ),
                                  iconSize: 20,
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white60,
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                          future:
                              isGetGender ? myDatabase.getGenderDetail() : null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () => _pickDateDialog(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'DATE OF BIRTH :',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              getFormateddate(selectedDate),
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        // Text('Enter Valid date.')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (modelG.GenderID == -1) {
                          print(':::::CALLING 1:::::::');
                          showAlertDialog(context);
                        } else {
                          print(':::::CALLING 2:::::::');
                          print(':::::GENDERID:::::::${modelU.Genderid}');
                          print(':::::CALLING 2:::::::${modelU.PhoneNo}');

                          RemoteService().upsertIntoUserTable(

                              UserID: widget.model != null
                                  ? widget.model!.id
                                  : -1,
                              city: modelC.CityID.toString(),
                              userName: nameController.text.toString(),
                              gender: modelG.GenderID.toString(),
                              phone: phoneController.text.toString(),
                              dob: selectedDate.toString(),
                              isFavorite: false,

                          );
                          setState(() {});
                          Navigator.of(context).pop();
                        }
                      }
                      setState(() {});
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.pink),
                        color: Colors.white,
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
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

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.pinkAccent,
      shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      title: Text(
        "Alert",
        style: TextStyle(color: Colors.white),
      ),
      content:
          Text("Please Select City", style: TextStyle(color: Colors.white)),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogForGender(BuildContext context) {
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.pinkAccent,
      shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      title: Text(
        "Alert",
        style: TextStyle(color: Colors.white),
      ),
      content:
          Text("Please Select Gender", style: TextStyle(color: Colors.white)),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogfordate(BuildContext context) {
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.pinkAccent,
      shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      title: Text(
        "Alert",
        style: TextStyle(color: Colors.white),
      ),
      content: Text("Only 18 Year above is allowed.",
          style: TextStyle(color: Colors.white)),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogForSuccess(BuildContext context) {
    Widget okButton = TextButton(
      child: Text(
        "Close",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.pinkAccent,
      shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      title: Text(
        "",
        style: TextStyle(color: Colors.white),
      ),
      content: Text("Detail Succesfully added.",
          style: TextStyle(color: Colors.white)),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (DateTime.now().difference(pickedDate!) < Duration(days: 6570)) {
        return showAlertDialogfordate(context);
      }
      setState(() {
        selectedDate = pickedDate!;
      });
    });
  }

  String getFormateddate(dateToFormate) {
    if (isValid) {}
    if (dateToFormate != null) {
      return DateFormat('dd-MM-yyyy').format(dateToFormate).toString();
    } else {
      return DateFormat('dd-MM-yyyy').format(DateTime.now());
    }
  }
}
