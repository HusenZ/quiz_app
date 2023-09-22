import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz,{super.key});
  //startQuiz is an argument that contains a function as a value
  final void Function() startQuiz;
  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          //Opacity(
          //  opacity: 0.3,
          //  child: Image.asset(
          //             'assets/images/quiz-logo.png',
          //             width: 300,
          //           ),
          const SizedBox(width: 30, height: 30,),
          Text('Learn Flutter in fun way',
            style: GoogleFonts.lato(fontSize: 28, color: Colors.white),),
          const SizedBox(width: 30,height: 30,),
          ElevatedButton.icon(onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt_outlined),
            label: const Text('Start Quiz'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
            ),)
        ],
      ),
    );
  }
}