import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Answer extends StatelessWidget {
  final void Function() selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: ()
        {
          selectHandler;
          Toast.show("Show Toast Message on Flutter");
        },
        child: Text(answerText),
      ),
    );
  }
}
