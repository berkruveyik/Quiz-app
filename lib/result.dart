import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  //Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore >= 41) {
      resultText = 'Excellent';
      print(resultScore);
    } else if (resultScore >= 31) {
      resultText = 'Very Good';
      print(resultScore);
    } else if (resultScore >= 21) {
      resultText = 'Good';
    } else if (resultScore >= 1) {
      resultText = 'Satisfied';
    } else {
      resultText = 'This is a poor score!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Done! Score ' '$resultScore',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          TextButton(
            onPressed: resetHandler,
            child: Container(
              color: Color.fromARGB(255, 180, 114, 224),
              padding: const EdgeInsets.all(14),
              child: const Text(
                'Restart Quiz',
                style: TextStyle(color: Color.fromARGB(255, 1, 139, 252)),
              ),
            ),
          ),
          // FlatButton is deprecated and should not be used
          // Use TextButton instead

          // FlatButton(
          //   child: Text(
          //     'Restart Quiz!',
          //   ), //Text
          //   textColor: Colors.blue,
          //   onPressed: resetHandler(),
          // ), //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
