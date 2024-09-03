import 'package:bloco_de_notas/model/bloco_de_notas.dart';
import 'package:bloco_de_notas/model/user_model.dart';
import 'package:bloco_de_notas/service/api_service.dart';
import 'package:flutter/material.dart';

class BlocoDeNotasProvider extends ChangeNotifier {
  List<BlocoDeNotas> _blocosDeNotas = [];

  List<BlocoDeNotas> get blocosDeNotas => _blocosDeNotas;

  void setDados(List<BlocoDeNotas> dados) {
    _blocosDeNotas = dados;
    notifyListeners();
  }

  void addBlocoDeNotas(BlocoDeNotas blocoDeNotas) {
    _blocosDeNotas.add(blocoDeNotas);
    notifyListeners();
  }

  void removeBlocoDeNotas(int index) {
    if (index >= 0 && index < blocosDeNotas.length) {
      blocosDeNotas.removeAt(index);
      notifyListeners();
    }
  }

  // Método para atualizar os blocos de notas
  Future<void> updateBlocoDeNotas(UserModel user) async {
    var _apiService = ApiService();
    List<BlocoDeNotas> novosDados =
        await _apiService.findByAuthorld(user.id, user.token!);
    setDados(novosDados);
  }
}
