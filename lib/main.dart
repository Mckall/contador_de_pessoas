import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      //MaterialApp é para chamar o Material Design
      title: "Contador de Pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0; //underline faz a variável ser acessível somente internamente
  String _infoText = "Pode Entrar";

  void _changePeople(int delta) {
    setState(() {
      //Executa o código e atualiza a tela.
      _people += delta;

      if (_people < 0) {
        _infoText = "Mundo invertido?!";
        _people++;
      } else if (_people <= 100) {
        _infoText = "Pode Entrar";
      } else {
        _infoText = "Lotado";
        _people--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30.0),
            ),
            Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                      'Versão 0.0.2107',
                      style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 14.0),
                    ),
                  ),
                )
          ],
        )
      ],
    );
  }
}
