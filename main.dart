import "dart:io";
import "dart:math";
import "dart:collection";

class MathQuestion {
  String? question;
  double? answer;

  MathQuestion(String _question, double _answer) {
    this.question = _question;
    this.answer = _answer;
  }
}

class Quiz {
  int? score;
  List<MathQuestion>? question;

  Quiz(int _score, List<MathQuestion> _question) {
    this.score = _score;
    this.question = _question;
  }

  void showScore() {
    print("Total Score: $score/${question?.length}");
  }
}

void main() {
  Quiz firstQuiz = Quiz(quiz(questions()), questions());
  firstQuiz.showScore();
}

List<MathQuestion> questions() {
  return [
    MathQuestion("20 * 3", 20 * 3),
    MathQuestion("50 - 5", 50 - 5),
    MathQuestion("1 + 999", 1 + 999)
  ];
}

void prompt(String? promptQuestion, List<double> answers) {
  stdout.write("$promptQuestion = ");
  double? userInput = double.parse(stdin.readLineSync().toString());
  answers.add(userInput);
}

int quiz(List<MathQuestion> questions) {
  final List<double> userAnswers = [];
  int score = 0;

  for (int i = 0; i < questions.length; ++i) {
    prompt(questions[i].question, userAnswers);
    for (double answer in userAnswers) {
      if (answer == questions[i].answer) {
        score++;
      }
    }
  }

  return score;
}