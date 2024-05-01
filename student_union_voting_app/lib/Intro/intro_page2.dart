import 'package:Votify/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class IntroPage2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 164, 141),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
          const SizedBox(height: 25,),
        
          // icon
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('lib/images/check.gif'),
          ),

           const SizedBox(height: 10,),
        
        //Heading
        Text(
          "Empower Your Campus Experience!", 
          style: GoogleFonts.teko(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1,
          ),),

          const SizedBox(height: 5,),
          // Context
          Text("Greetings, future leader! This isn't just an app; it's your gateway to shaping campus history. From electing student representatives to fueling campus initiatives, you hold the power. Join us as we embark on a journey of empowerment, unity, and progress. Let's ignite change together!",
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