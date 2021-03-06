import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

void main() {
  runApp(MaterialApp(
      //MaterialApp é para chamar o Material Design
      title: "Contador de Pessoas",
      home: Home()));
}

Future<String> getVersionNumber() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final String version = packageInfo.version;
  final String versionApp = 'Versão $version';
  return versionApp;
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
              child: FutureBuilder(
                future: getVersionNumber(),
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) => Text(
                  snapshot.hasData ? snapshot.data : 'Abrindo...',
                  style: const TextStyle(color: Colors.white, fontSize: 12.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
