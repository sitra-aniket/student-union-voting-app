import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  final String text;
  const GetStartedButton({super.key, required this.text });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue[300],borderRadius: BorderRadius.circular(40),),
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //text
          Text(text, style: TextStyle(color: Colors.white),),
          const SizedBox(width: 10),
          //icons
          Icon(Icons.arrow_forward, color:Colors.white ),
        ],
      ),

    );
  }
}