// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function callback;
  
  const CalculatorButton({ Key? key, required this.text, required this.callback, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: EdgeInsets.all(15.0),
                 child: SizedBox(
                  width: 60,
                  height: 60,
                   child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(text,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                            onPressed: ()=>callback(text),
                            color: Color.fromARGB(255, 224, 138, 240),
                      ),
                 ),
      
    );
  }
}