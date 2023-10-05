import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class paginaInicial extends StatefulWidget {
  const paginaInicial({super.key});

  @override
  State<paginaInicial> createState() => _paginaInicialState();
}

class _paginaInicialState extends State<paginaInicial> {
  void _navegarHttp() {
    Navigator.pushNamed(context, "/pagina-http");
  }

  void _navegarFuture() {
    Navigator.pushNamed(context, "/pagina-future");
  }
  void _navegarDados() {
    Navigator.pushNamed(context, "/pagina-dados");
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
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: _navegarHttp,
                child: Text("Exemplo HTTP"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  backgroundColor: Colors.orange,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: _navegarFuture,
                child: Text("Exemplo Future"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  backgroundColor: Colors.orange,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: _navegarDados,
                child: Text("Dados em Lista"),
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
  }
}
