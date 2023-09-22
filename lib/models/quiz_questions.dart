class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);//of() creates a new list based on the old list i.e. is copies the list
    shuffledList.shuffle();
    return shuffledList;
  }
}
