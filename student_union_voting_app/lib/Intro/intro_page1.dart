import 'package:Votify/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class IntroPage1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 152, 141, 255),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
          const SizedBox(height: 25,),
        
          // icon
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('lib/images/debate.gif'),
          ),

           const SizedBox(height: 5,),
        
        //Heading
        Center(
          child: Text(
            "Welcome to Your Voice, Your Choice!", 
            style: GoogleFonts.teko(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.0,
            ),),
        ),

          const SizedBox(height: 5,),
          // Context
          Text("Hey there, student! Welcome to the heart of your campus democracy. With this app, you're not just a voter; you're a changemaker. Get ready to explore the vibrant landscape of student leadership, where every tap counts. Let's dive in and make your voice heard!",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          ),
        ],),
      ),
    );
  }
}