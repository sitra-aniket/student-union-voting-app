import 'package:Votify/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class IntroPage3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 141, 204, 255),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
          const SizedBox(height: 10,),
        
          // icon
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('lib/images/voting.gif'),
          ),

           const SizedBox(height: 10,),
        
        //Heading
        Text(
          "Step into the Future of Student Governance!", 
          style: GoogleFonts.teko(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1,
          ),),

          const SizedBox(height: 5,),
          // Context
          Text("Hello, trailblazer! Get ready to revolutionize the way you engage with campus politics. With this app, you're not just witnessing democracy; you're driving it. Explore the array of visionary candidates, cast your vote with confidence, and watch as your campus transforms before your eyes. The future starts now!",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          ),
        ],),
      ),
    );
  }
}