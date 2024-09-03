import 'package:bloco_de_notas/model/bloco_de_notas.dart';
import 'package:bloco_de_notas/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'https://api-post-it-1.onrender.com';

  Future<UserModel> register(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      print('Post enviado com sucesso');
      print('Corpo da resposta: ${response.body}');

      final userJson = json.decode(response.body)['user'];
      final token = json.decode(response.body)['token'];
      final user = UserModel.fromJson(userJson);
      user.setToken(token);
      return user;
    } else {
      print('Erro ao enviar post. Código de status: ${response.statusCode}');
      print('Corpo da resposta: ${response.body}');
      throw Exception('Falha ao registrar usuário');
    }
  }

  Future<UserModel> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      print('Logado com sucesso');
      print('Corpo da resposta: ${response.body}');

      final userJson = json.decode(response.body)['user'];
      final user = UserModel.fromJson(userJson);
      final token = json.decode(response.body)['token'];
      user.setToken(token);

      return user;
    } else {
      print('Erro ao enviar post. Código de status: ${response.statusCode}');
      print('Corpo da resposta: ${response.body}');
      throw Exception('Falha ao registrar usuário');
    }
  }

  Future<List<BlocoDeNotas>> findByAuthorld(int id, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/postIt/findByAuthorId/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token'
      },
    );
    if (response.statusCode == 200) {
      print('Deu certo MLKAO');
      print('${response.body} estou printando a response');
      final List<dynamic> postsJson = json.decode(response.body);
      return postsJson.map((json) => BlocoDeNotas.fromJson(json)).toList();
    }
    return [];
  }

  Future<BlocoDeNotas> createPostIt(
      String title, String description, String token, int authorId) async {
    final Map<String, dynamic> postData = {
      'title': title,
      'description': description,
      'author': authorId,
    };

    final response = await http.post(
      Uri.parse('$baseUrl/postIt/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token', // 'Bearer' em maiúsculo
      },
      body: jsonEncode(postData), // Convertendo o mapa para JSON
    );

    if (response.statusCode == 200) {
      print('PostIt criado com sucesso');
      print('Corpo da resposta: ${response.body}');

      final postJson = json.decode(response.body);
      return BlocoDeNotas.fromJson(postJson);
    } else {
      print('Erro ao criar o postIt. Código de status: ${response.statusCode}');
      print('Corpo da resposta: ${response.body}');
      throw Exception('Falha ao criar o postIt');
    }
  }

  Future<BlocoDeNotas> updatePostIt(String token, String title,
      String description, int author, int id) async {
    Map<String, dynamic> postData = {
      'id': id,
      'title': title,
      'description': description,
      'author': author,
    };
    var response = await http.put(Uri.parse("$baseUrl/postIt/update"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'bearer $token', // 'Bearer' em maiúsculo
        },
        body: jsonEncode(postData));
    if (response.statusCode == 200) {
      print('deu certo: ${response.body}');
      final postJson = json.decode(response.body);
      return BlocoDeNotas.fromJson(postJson);
    } else {
      print('deu errado: ${response.body}');
      throw Exception('Erro ao atualizar post-It');
    }
  }

  Future<void> deletePostIt(String token, String title, String description,
      int author, int id) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/postIt/delete"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token', // 'Bearer' em maiúsculo
      },
      body: jsonEncode({
        'id': id,
        'title': title,
        'description': description,
        'author': author,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao deletar post-It: ${response.statusCode}');
    }
  }
}
