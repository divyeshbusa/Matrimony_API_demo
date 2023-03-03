import 'package:final_matrimony/Componets/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  bool isValid = true;

  ForgotScreen(this.isValid, {Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  // ignore: non_constant_identifier_names
  late TextEditingController MailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    MailController = TextEditingController(text: 'Mail');

    phoneController = TextEditingController(text: 'Phone');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              size: 35,
              color: Colors.pink,
            ),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              // Image.asset(
              //   "assets/images/background.jpeg",
              //   fit: BoxFit.fill,
              // ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      Icon(
                        shadows: [
                          BoxShadow(
                              color: CupertinoColors.black,
                              offset: Offset(-3, 2))
                        ],
                        CupertinoIcons.lock_shield,
                        size: 180,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Trouble logging in ?",
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Enter mail or mobile number and we'll",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "send you a link to get back your",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "account.",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ForgotScreen(true),
                                  ),
                                );
                              },
                              child: Text(
                                "Mail",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                            ),
                            SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ForgotScreen(false),
                                  ),
                                );
                              },
                              child: Text(
                                "Phone",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                            ),
                          ]),
                      SizedBox(height: 15),
                      widget.isValid
                          ? MyTextField(
                              controller: MailController,
                              hintText: "Mail",
                              obscureText: false,
                              onChange: (value) {})
                          : MyTextField(
                              controller: MailController,
                              hintText: "Phone No.",
                              obscureText: false,
                              onChange: (value) {}),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
