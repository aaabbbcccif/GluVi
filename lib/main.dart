import 'package:flutter/material.dart';
import 'package:gluvi/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
 }

class _MyHomePageState extends State<MyHomePage>{
  String displayText = 'Привеет!!';
  Color btncolor = Colors.amber;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Главная страница'),),
      body: Text(displayText),
      floatingActionButton: FloatingActionButton(backgroundColor: btncolor ,child: Text('Нажми на меня!'), onPressed: (){
        setState(() {
          displayText = 'Как дела":)';
          btncolor = btncolor == Colors.greenAccent ? Colors.amber : Colors.greenAccent;
        });
      }),
    );
  }
}




