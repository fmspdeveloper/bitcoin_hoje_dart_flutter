import 'package:flutter/material.dart';

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
    },
    home: paginaInicial(),
    debugShowCheckedModeBanner: false,
  ));
}
