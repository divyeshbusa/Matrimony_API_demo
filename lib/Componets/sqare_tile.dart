import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagepath;

  const SquareTile({Key? key, required this.imagepath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
      color: Colors.white70),
      child: Image.asset(
        imagepath,
        height: 30,
      ),
    );
  }
}
