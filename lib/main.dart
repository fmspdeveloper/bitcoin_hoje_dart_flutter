import 'dart:js';

import 'package:flutter/material.dart';

import 'dados.dart';
import 'future.dart';
import 'home.dart';
import 'http.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/pagina-http": (context) => paginaHttp(),
      "/pagina-future": (context) => paginaFuture(),
      "/pagina-inicio": (context) => paginaInicial(),
      "/pagina-dados": (context)=> paginaDados(),
    },
    home: paginaInicial(),
    debugShowCheckedModeBanner: false,
  ));
}
