// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:basic_calculator/widgets/buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Calculator(),
    );
  }
}
class Calculator extends StatefulWidget {
  const Calculator({ Key? key }) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int firstNum = 0;
  int secondNum=0;
  String history='';
  String textToDisplay='';
  String res='';
  String operation='';
  
  void btnOnClick(String btnVal){
    print(btnVal);
    if(btnVal=='C'){
      textToDisplay='';
      firstNum=0;
      secondNum=0;
      res='';
      history='';
    }
    else if(btnVal == '+'||btnVal =='-'||btnVal =='*'||btnVal =='/'){
       firstNum=int.parse(textToDisplay);
       res='';
       operation=btnVal;
    }
    else if(btnVal =='='){
     secondNum=int.parse(textToDisplay);
     if(operation=='+'){
     res=(firstNum+secondNum).toString();
     history=firstNum.toString()+ operation.toString() +secondNum.toString();
    }
     if(operation=='-'){
     res=(firstNum-secondNum).toString();
     history=firstNum.toString()+ operation.toString() +secondNum.toString();
    }
     if(operation=='*'){
     res=(firstNum*secondNum).toString();
     history=firstNum.toString()+ operation.toString() +secondNum.toString();
    }
     if(operation=='/'){
     res=(firstNum/secondNum).toString();
     history=firstNum.toString()+ operation.toString() +secondNum.toString();
    }
    
    }
    else{
      res=int.parse(textToDisplay+btnVal).toString();
    }
    setState(() {
      textToDisplay=res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text('Flutter Basic Calculator'))
        ),
        body: Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              child: Padding(padding: EdgeInsets.all(12),
              child: Text(history,
              style: TextStyle(color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold),),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(textToDisplay,
              style: TextStyle(color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.bold),
              ),
             // alignment: Alignment(1.0,1.0),
            ),
            SizedBox(height:10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(text: '9',callback: btnOnClick,),
                CalculatorButton(text:'8',callback: btnOnClick,),
                CalculatorButton(text: '7',callback: btnOnClick,),
                CalculatorButton(text: '+',callback: btnOnClick,),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(text: '6',callback: btnOnClick,),
                CalculatorButton(text:'5',callback: btnOnClick,),
                CalculatorButton(text: '4',callback: btnOnClick,),
                CalculatorButton(text: '-',callback: btnOnClick,),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(text: '3',callback: btnOnClick,),
                CalculatorButton(text:'2',callback: btnOnClick,),
                CalculatorButton(text: '1',callback: btnOnClick,),
                CalculatorButton(text: '*',callback: btnOnClick,),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 CalculatorButton(text: 'C',callback: btnOnClick,),
                  CalculatorButton(text:'0',callback: btnOnClick,),
                  CalculatorButton(text: '=',callback: btnOnClick,),
                 CalculatorButton(text: '/',callback: btnOnClick,),
        ],)
          ],)
          ));
  }
}

