import 'package:final_matrimony/Login_pages/login_page.dart';
import 'package:final_matrimony/pages/add_user.dart';

import 'package:final_matrimony/pages/favourite_user_list.dart';
import 'package:final_matrimony/pages/female_user_list.dart';
import 'package:final_matrimony/pages/male_user_list.dart';
import 'package:final_matrimony/pages/user_list.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  bool bookmarked = false;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.blueGrey,
          // elevation: 10,
          shape: const ContinuousRectangleBorder(
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
                      'Dashboard',
                      style: GoogleFonts.montserratAlternates(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                        child: Text(
                      'and so the',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'GreatVibes-Regular',
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black38,
                              offset: Offset(5, 5),
                            ),
                          ]),
                    )),
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Adventure begins...',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: 'GreatVibes-Regular',
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  // color of the shadow
                                  color: Colors.black38,
                                  offset: Offset(5, 5),
                                ),
                              ]),
                        ),
                        Text(
                          '🤍',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black38,
                                  offset: Offset(5, 5),
                                ),
                              ]),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blueGrey),
                      height: 40,
                      width: 40,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 30),
                    const Text(
                      'Profile',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blueGrey),
                      height: 40,
                      width: 40,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 30),
                    const Text(
                      'Add User',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddUser(
                        model: null,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blueGrey),
                      height: 40,
                      width: 40,
                      child: const Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 30),
                    const Text(
                      'Log Out',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => loginPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/background.jpeg",
              fit: BoxFit.fill,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 130, 8, 8),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserList("img"),
                          ),
                        );
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          child: Card(
                            color: Colors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  child: Icon(
                                    Icons.list,
                                    size: 90,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(30, 0, 25, 25),
                                  child: Text(
                                    'User List',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavouriteUser(),
                          ),
                        );
                      },
                      child: Container(
                        child: Card(
                          color: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                child: Icon(
                                  Icons.favorite_outlined,
                                  size: 90,
                                  color: Colors.pink,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(30, 0, 25, 25),
                                child: Text(
                                  'Favourite',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => femaleUser(),
                          ),
                        );
                      },
                      child: Container(
                        child: Card(
                          color: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                child: Icon(
                                  Icons.female_outlined,
                                  size: 90,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(30, 0, 25, 25),
                                child: Text(
                                  'Women',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => maleUser(),
                          ),
                        );
                      },
                      child: Container(
                        child: Card(
                          color: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                child: Icon(
                                  Icons.male_outlined,
                                  size: 90,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 0, 25, 25),
                                child: Text(
                                  'Men',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
