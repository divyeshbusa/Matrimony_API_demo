import 'package:final_matrimony/api/User.dart';
import 'package:final_matrimony/api/remote_service.dart';
import 'package:final_matrimony/database/database.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String userId ;

  ProfileDetail(this.userId, {super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  // ignore: non_constant_identifier_names
  DateTime SelectedDate = DateTime.now();
  MyDatabase db = MyDatabase();
  List<User> localList = [];
  List<User> searchList = [];

  bool isGetData = true;

  @override
  Widget build(BuildContext context) {
    // var ID = int.parse(widget.userId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail',
          style: TextStyle(color: Colors.pinkAccent),
        ),
        backgroundColor: Colors.grey.shade100,
        foregroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder<User?>(
        builder: (context, snapshot) {
          if (snapshot != null && snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/${snapshot.data!.userName!.trim()}.jpeg',
                    width: 200,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  snapshot.data!.userName.toString(),
                  style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(height: 10),
                Text(
                  'Phone No. : ${snapshot.data!.phone}',
                  style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                SizedBox(height: 10),
                Text(
                  'City Name : ${snapshot.data!.city}',
                  style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                SizedBox(height: 10),
                Text(
                  'Date Of Birth : ${snapshot.data!.dob}',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'FAVOURITE : ',
                          style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (snapshot.data!.isFavorite == 'true') {
                                snapshot.data!.isFavorite = 'false';
                              } else if (snapshot.data!.isFavorite ==
                                  'false') {
                                snapshot.data!.isFavorite = 'true';
                              }
                              RemoteService().updateFav(
                                  isfavourite: snapshot.data!.isFavorite,
                                  userId: snapshot.data!.id);
                            });
                            // print(
                            //     '::::::::::1 INDEX!!!!${snapshot.data!
                            //         .id}');
                            // print(
                            //     '::::::::::1!!!!${snapshot.data!
                            //         .isFavorite}');
                            //
                            // print(
                            //     '::::::::::2 INDEX!!!!${snapshot.data!
                            //         .id}');
                            // print(
                            //     '::::::::::2!!!${snapshot.data!
                            //         .isFavorite}');
                          },
                          child: Icon(
                            snapshot.data!.isFavorite == 'true'
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: Colors.pinkAccent,
                            size: 28,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            );
          }else{
            return CircularProgressIndicator();
          }
        },
        future: isGetData
            ? RemoteService().getDataById('/userlist/${widget.userId.toString()}')
            : null,
      ),
    );
  }
}
