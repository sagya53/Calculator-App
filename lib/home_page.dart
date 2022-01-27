import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var output = "";
  TextEditingController num1 = new TextEditingController();
  TextEditingController num2 = new TextEditingController();
  var result = "Output";
  _output(){
    setState(() {
      result = (_add() || _divide() || _minus() || _mutliplication())? result : "0";
    });
  }
  _clearText() {
    num1.clear();
    num2.clear();
  }
  _add(){
    setState((){
      int sum = int.parse(num1.text) + int.parse(num2.text);
      result = sum.toString();
    });
  }
  _minus(){
    setState((){
      int sum = int.parse(num1.text) - int.parse(num2.text);
      result = sum.toString();
    });
  }
  _mutliplication(){
    setState((){
      int sum = int.parse(num1.text) * int.parse(num2.text);
      result = sum.toString();
    });
  }
  _divide() {
    setState(() {
      int sum = int.parse(num1.text) ~/ int.parse(num2.text);
      result = sum.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(40,10,40,10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    // labelText: 'User Name',
                    hintText: 'Enter first value',
                  ),
                  // decoration: InputDecoration(labelText: 'Title'),
                  controller: num1,

                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40,10,40,10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    // labelText: 'User Name',
                    hintText: 'Enter Second value',
                  ),
                  controller: num2,
                ),
              ),
              Text(result,style: TextStyle( fontSize: 30),),
              RaisedButton(child: Text("+"),onPressed:() => _add(),),
              RaisedButton(child: Text("-"),onPressed: () => _minus(),),
              RaisedButton(child: Text("*"),onPressed: () => _mutliplication(),),
              RaisedButton(child: Text("/"),onPressed: () => _divide(),),
              RaisedButton(child: Text("Clear"),onPressed: () => _clearText(),),

            ],
          ),
        ),
      ),
    );
  }
}
