import 'dart:async';
import 'dart:convert';

import 'package:bitcoin_hoje/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class paginaDados extends StatefulWidget {
  const paginaDados({super.key});

  @override
  State<paginaDados> createState() => _paginaDadosState();
}

class _paginaDadosState extends State<paginaDados> {
  String url = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _carregarDados() async {
    Uri uri = Uri.parse(url + "/posts");

    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> dadosJson = jsonDecode(response.body);
      List<Post> posts = dadosJson.map((data) {
        // Verifica se os campos não são nulos antes de criar uma instância de Post
        if (data['userId'] != null &&
            data['id'] != null &&
            data['title'] != null &&
            data['body'] != null) {
          return Post(
            data['userId'],
            data['id'],
            data['title'],
            data['body'],
          );
        } else {
          // Se algum campo for nulo, retorne uma instância de Post com valores padrão ou trate conforme necessário
          return Post(0, 0, "Sem título", "Sem corpo");
        }
      }).toList();
      return posts;
    } else {
      throw Exception("Falha ao carregar dados");
    }
  }

  _post() async {
    var corpo = jsonEncode(
      {
        "userId": 122,
        "id": null,
        "title": "Titulo novo",
        "body": "Descricao da postagem",
      },
    );
    Uri uri = Uri.parse(url + "/posts");
    http.Response response = await http.post(
      uri,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo,
    );
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _put() async {
    var corpo = jsonEncode(
      {
        "userId": 122,
        "id": null,
        "title": "Titulo novo",
        "body": "Descricao da postagem",
      },
    );
    Uri uri = Uri.parse(url + "/posts/2");
    http.Response response = await http.put(
      uri,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo,
    );
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _patch() async {
    var corpo = jsonEncode(
      {
        "userId": 122,
        "id": null,
        "title": "Titulo novo",
        "body": "Descricao da postagem",
      },
    );
    Uri uri = Uri.parse(url + "/posts/2");
    http.Response response = await http.patch(
      uri,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo,
    );
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _delete() async {
    var corpo = jsonEncode(
      {
        "userId": 122,
        "id": null,
        "title": "Titulo novo",
        "body": "Descricao da postagem",
      },
    );
    Uri uri = Uri.parse(url + "/posts/2");
    http.Response response = await http.delete(
      uri,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo,
    );
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus posts"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _post,
                  child: Text("Salvar"),
                ),
                ElevatedButton(
                  onPressed: _put,
                  child: Text("Atualizar"),
                ),
                ElevatedButton(
                  onPressed: _delete,
                  child: Text("Remover"),
                ),
              ],
            ),
            //Future

            Expanded(
              child: FutureBuilder<List<Post>>(
                  future: _carregarDados(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text("Erro: ${snapshot.error}");
                    } else if (snapshot.hasData) {
                      List<Post> posts = snapshot.data!;
                      return ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(posts[index].title),
                            subtitle: Text(posts[index].body),
                          );
                        },
                      );
                    } else {
                      return Text("Nenhum dado disponivel");
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
