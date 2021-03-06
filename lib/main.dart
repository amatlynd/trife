import 'package:flutter/material.dart';
import 'package:trife/components/rounded_icon_button.dart';
import 'constants.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int value = 0;
  Timer timer;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$value',
              style: Theme.of(context).textTheme.headline4,
            ),
/*            GestureDetector(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(
                    child: Text(
                      'value $value',
                      style: TextStyle(fontSize: 40),
                    )),
              ),
              onTapDown: (TapDownDetails details) {
                print('down');
                timer = Timer.periodic(Duration(milliseconds: 100), (t) {
                  setState(() {
                    value++;
                  });
                  print('value $value');
                });
              },
              onTapUp: (TapUpDetails details) {
                print('up');
                timer.cancel();
              },
              onTapCancel: () {
                print('cancel');
                timer.cancel();
              },
            ),*/
            RoundIconButton(
              icon: kIconPlus,
              callback: (){
                setState(() {
                  value++;
                });
              },
            ),
            RoundIconButton(
              icon: kIconMinus,
              callback: (){
                setState(() {
                  value--;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}
