import 'package:final_matrimony/Componets/my_button.dart';
import 'package:final_matrimony/Componets/my_textfield.dart';
import 'package:final_matrimony/Componets/sqare_tile.dart';
import 'package:final_matrimony/pages/dashboard.dart';
import 'package:final_matrimony/pages/forgot_screen_design.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class loginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                    child:
                        Lottie.asset('assets/images/splash_screen_proposal.json'),
                    height: 230),
                Text(
                  'MATCH MAKING',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Find Your ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '" Someone Special "',
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                MyTextField(
                    controller: usernameController,
                    hintText: "Username",
                    obscureText: false,onChange: (value){return Container();}),
                SizedBox(height: 15),
                MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,onChange: (value){return Container();}),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: InkWell(
                    // onTap: () {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //       builder: (context) => ForgotScreen(true),
                    //     ),
                    //   );
                    // },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ForgotScreen(true),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.pink),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 30),
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.of(context).push(
                //         MaterialPageRoute(
                //           builder: (context) => DashBoard(),
                //         ),
                //       );
                //     },
                //     child: Container(
                //       padding: EdgeInsets.all(20),
                //       decoration: BoxDecoration(
                //           color: Colors.pinkAccent,
                //           borderRadius: BorderRadius.circular(20)),
                //       child: Center(
                //         child: Text(
                //           'Sign in',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 18,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                MyButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DashBoard(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.pink[400],
                      )),
                      Text(
                        'Or Continue With',
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.pink[400],
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagepath: 'assets/images/google.png'),
                    SizedBox(width: 25),
                    SquareTile(imagepath: 'assets/images/apple.png'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member ?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' Register Now',
                      style: TextStyle(
                          color: Colors.pinkAccent, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
