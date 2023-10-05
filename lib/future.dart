import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class paginaFuture extends StatefulWidget {
  const paginaFuture({super.key});

  @override
  State<paginaFuture> createState() => _paginaFutureState();
}

class _paginaFutureState extends State<paginaFuture> {
  Future<Map> _recuperarPrecoFuture() async {
    String url = "https://blockchain.info/ticker";
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  void _homePage() {
    Navigator.pushNamed(context, "/pagina-inicio");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
        future: _recuperarPrecoFuture(),
        builder: (context, snapshot) {
          String resultado;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              print("conexao waiting");
              resultado = "carregando...";
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              print("conexao done");
              if (snapshot.hasError) {
                resultado = "erro ao carregar os dados";
              } else {
                double valor = snapshot.data?["BRL"]["buy"];
                resultado = "preço do bitcoin: ${valor.toString()}";
              }
              break;
          }

          return Scaffold(
            appBar: AppBar(
              title: Text("Bitcoin Future"),
              backgroundColor: Colors.orange,
              centerTitle: true,
            ),
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: Image.asset("images/bitcoin.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "R\$${snapshot.data?["BRL"]["buy"]}",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: ElevatedButton(
                      onPressed: _homePage,
                      child: Text("Inicio"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        backgroundColor: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
