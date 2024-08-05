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

  Future<List<BlocoDeNotas>> findByAuthorld(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/postIt/findByAuthorId/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print('Deu certo MLKAO');
      print('$response estou printando a response');
      final List<dynamic> postsJson = json.decode(response.body);
      return postsJson.map((json) => BlocoDeNotas.fromJson(json)).toList();
    }
    return [];
  }
}
