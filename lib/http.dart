import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class paginaHttp extends StatefulWidget {
  const paginaHttp({super.key});

  @override
  State<paginaHttp> createState() => _paginaHttpState();
}

class _paginaHttpState extends State<paginaHttp> {
  var bitcoin = "";

  void _receberDados() async {
    String url = "https://blockchain.info/ticker";
    Uri uri = Uri.parse(url);

    http.Response response;
    response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        bitcoin =
            NumberFormat.currency(locale: 'pt_BR').format(data["BRL"]["sell"]);
      });
    }
  }

  void _homePage() {
    Navigator.pushNamed(context, "/pagina-inicio");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bitcoin HOJE"),
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
                "${bitcoin}",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: _receberDados,
                child: Text("Atualizar"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  backgroundColor: Colors.orange,
                ),
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
    ;
  }
}
