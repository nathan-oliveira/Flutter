import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GOD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter GOD'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  //final alController = TextEditingController();
  //final pesoController = TextEditingController();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _imc = 0.0;
  double alt = 0.0;
  double peso = 0.0;

  void _calcIMC(double a, double p) {
    setState(() {
      _imc = p / (a*a);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              onChanged: (text) {
                alt = double.parse("$text");
              },
              //controller: altController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0.5',
              ),
            ),
            new TextField(
              onChanged: (text) {
                peso = double.parse("$text");
              },
              //controller: pesoController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0.0'
              ),
            ),
            Text(
              'seu IMC é',
            ),
            Text(
              '$_imc',
              style: Theme.of(context).textTheme.display1,
            ),
            new RaisedButton(
              child: const Text('Calcular IMC'),
              color: Theme.of(context).accentColor,
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                _calcIMC(alt, peso);
              },
            )
          ],
        ),
      ),
    );
  }
}
