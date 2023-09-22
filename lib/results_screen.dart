import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary.dart';
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswer, required this.restart});
  final void Function() restart;
  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++){
      summary.add({
        'question_index': i,
        'question':questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
   }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                'You Answered $numCorrectQuestions out of $numTotalQuestions questions \n \t correctly!',
                style: GoogleFonts.lato(fontSize: 20),
              ),
              const SizedBox(height: 30,),
              QuestionsSummary(summaryData),
              const SizedBox(height: 30,),
              TextButton.icon(
                  onPressed: restart,
                  icon: const Icon(Icons.restart_alt_sharp),
                  label: const Text('Restart', style: TextStyle(fontSize: 20),),
                  style: TextButton.styleFrom(),
              )
            ],
          ),
      ),
    );
  }
}