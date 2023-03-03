import 'dart:convert';

import 'package:final_matrimony/Componets/my_textfield.dart';
import 'package:final_matrimony/Models/user_list_model.dart';
import 'package:final_matrimony/api/User.dart';
import 'package:final_matrimony/api/remote_service.dart';
import 'package:final_matrimony/database/database.dart';
import 'package:final_matrimony/pages/add_user.dart';
import 'package:final_matrimony/pages/profile_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class femaleUser extends StatefulWidget {
  const femaleUser({super.key});

  @override
  State<femaleUser> createState() => _femaleUserState();
}

// ignore: camel_case_types
class _femaleUserState extends State<femaleUser> {
  MyDatabase db = MyDatabase();
  UserModel modelU = UserModel(
      UserName1: 'Enter Name:',
      PhoneNo1: 000000,
      Cityid1: 0,
      Photo1: '',
      GenderID1: 0,
      IsFavourite1: false,
      DOB1: 'Select DOB');
  List<User> localList = [];
  List<User> searchList = [];

  bool isGetData = true;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    db.copyPasteAssetFileToRoot();
    db.initDatabase();
    controller.addListener(() {
      print('::::::::${controller.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          elevation: 10,
          shape: ContinuousRectangleBorder(
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
                    padding: EdgeInsets.only(left: 45),
                    child: Text(
                      'USER LIST',
                      style: GoogleFonts.montserratAlternates(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder<List<User>?>(
              builder: (context, snapshot) {
                if (snapshot != null && snapshot.hasData) {
                  if (isGetData) {
                    localList.addAll(snapshot.data!);
                    searchList.addAll(localList);
                  }
                  isGetData = false;

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          border: Border.all(color: Colors.pinkAccent),
                        ),
                        child: TextField(
                          style:
                          TextStyle(color: Colors.pinkAccent, fontSize: 17),
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Search'),
                          controller: controller,
                          onChanged: (value) {
                            searchList.clear();
                            for (int i = 0; i < localList.length; i++) {
                              if (localList[i]
                                  .userName!
                                  .toLowerCase()
                                  .contains(value.toLowerCase())) {
                                searchList.add(localList[i]);

                                print(
                                    'searchList::::LENGHTH::::${searchList.length}');
                                print(
                                    'searchList::::LENGHTH::::${searchList[i]}');
                              }
                            }
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => ProfileDetail(
                                //       int.parse(
                                //           searchList[index].id.toString()),
                                //       searchList[index].userName.toString(),
                                //       searchList[index].phone.toString(),
                                //       searchList[index].city.toString(),
                                //       searchList[index].dob.toString(),
                                //       searchList[index].isFavorite.toString(),
                                //     ),
                                //   ),
                                // );
                              },
                              child: Card(
                                margin: const EdgeInsets.all(10),
                                elevation: 10,
                                shape: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: Colors.pinkAccent, width: 2)),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            searchList[index]
                                                .userName
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Phone No. :${searchList[index].phone.toString()}',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 2),
                                        ],
                                      ),
                                      Row(children: [
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context:
                                                context,
                                                builder:
                                                    (BuildContext
                                                contex) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "Delete"),
                                                    content:
                                                    Text("Do you want to delete this record"),
                                                    actions: [
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        children: [
                                                          ElevatedButton(
                                                            onPressed: () async {
                                                              var id = searchList![index].id;
                                                              var deletedUserID = await RemoteService().deleteData('/userlist/$id');
                                                              // if (deletedUserID > 0) {
                                                              //   searchList!.removeAt(index);
                                                              // }
                                                              setState(() {
                                                                searchList.removeAt(index);
                                                                localList.removeAt(index);
                                                                Navigator.of(context).pop();
                                                              });
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: Text("Delete"),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: Text("No"),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Icon(
                                            Icons
                                                .delete_rounded,
                                            color:
                                            Colors.red,
                                            size: 30,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (searchList[index]
                                                  .isFavorite =='true') {
                                                searchList[index].isFavorite =
                                                'false';
                                              }
                                              else if (searchList[index]
                                                  .isFavorite == 'false') {
                                                searchList[index].isFavorite =
                                                'true';
                                              }
                                              RemoteService().updateFav(
                                                  isfavourite: searchList[index]
                                                      .isFavorite,
                                                  userId: searchList[index].id);
                                            });
                                            // print(
                                            //     '::::::::::1 INDEX!!!!${searchList[index]
                                            //         .id}');
                                            // print(
                                            //     '::::::::::1!!!!${searchList[index]
                                            //         .isFavorite}');
                                            //
                                            // print(
                                            //     '::::::::::2 INDEX!!!!${searchList[index]
                                            //         .id}');
                                            // print(
                                            //     '::::::::::2!!!${searchList[index]
                                            //         .isFavorite}');
                                          },
                                          child: Icon(
                                            searchList[index].isFavorite == 'true'
                                                ? Icons.favorite
                                                : Icons
                                                .favorite_border_outlined,
                                            color: Colors.pinkAccent,
                                            size: 28,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => AddUser(
                                                  model: searchList[index],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.mode_edit_outline_sharp,
                                            color: Colors.blueGrey,
                                            size: 25,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: searchList.length,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              future: isGetData ? RemoteService().getData('/userlist?Gender=1') : null),
        ),
      ),
    );
  }



  showAlertDialog(BuildContext context, index) {
    Widget yesButton = TextButton(
      child: Text(
        "YES",
        style: TextStyle(color: Colors.pink),
      ),
      onPressed: () async {
        int deletedUserID =
        await RemoteService().deleteData(searchList[index].id.toString());
        print('searchList::::::UserID:::::${deletedUserID}');
        print('searchList::::::UserID:::::${searchList[index].id}');
        if (deletedUserID == searchList[index].id) {
          searchList.removeAt(index);
          print('searchList::::::Index:::::${index}');
        }
        Navigator.of(context).pop();
        setState(() {});
      },
    );
    Widget noButton = TextButton(
      child: Text(
        "NO",
        style: TextStyle(color: Colors.pink),
      ),
      onPressed: () {
        print('searchList::::::Index:::::${index}');
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      title: Text(
        "Alert",
        style: TextStyle(color: Colors.pink),
      ),
      content: Text("Are You Sure Want To Delete Data.",
          style: TextStyle(color: Colors.black)),
      actions: [
        yesButton,
        noButton,
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
}
