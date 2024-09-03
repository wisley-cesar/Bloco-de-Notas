import 'package:bloco_de_notas/model/bloco_de_notas.dart';
import 'package:bloco_de_notas/providers/bloco_de_notas_provaider.dart';
import 'package:bloco_de_notas/providers/use_provaider.dart';
import 'package:bloco_de_notas/service/api_service.dart';
import 'package:bloco_de_notas/widgets/My_Card/my_cart_to_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  late BlocoDeNotas _blocoDeNotas;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  bool _isEditing = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final blocoDeNotasProvider = Provider.of<BlocoDeNotasProvider>(context);

    // Pegue o ID do bloco de notas dos argumentos
    final id = ModalRoute.of(context)!.settings.arguments as int?;

    if (id == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro: ID do bloco de notas não fornecido.'),
      ));
      // Pode-se optar por retornar ou lidar com o erro de forma mais adequada
      return;
    }

    _blocoDeNotas = blocoDeNotasProvider.blocosDeNotas
        .firstWhere((bloco) => bloco.id == id);

    _titleController = TextEditingController(text: _blocoDeNotas.title);
    _descriptionController =
        TextEditingController(text: _blocoDeNotas.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveDescription() async {
    setState(() {
      _isEditing = false;
    });

    final apiService = ApiService();
    final blocoDeNotasProvider =
        Provider.of<BlocoDeNotasProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      BlocoDeNotas updatedBloco = await apiService.updatePostIt(
        userProvider.user!.token!,
        _titleController.text,
        _descriptionController.text,
        userProvider.user!.id,
        _blocoDeNotas.id,
      );

      // Atualizar a lista localmente no provider
      int index = blocoDeNotasProvider.blocosDeNotas
          .indexWhere((bloco) => bloco.id == updatedBloco.id);
      if (index != -1) {
        blocoDeNotasProvider.blocosDeNotas[index] = updatedBloco;
        blocoDeNotasProvider.notifyListeners();
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('PostIt atualizado com sucesso!'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao atualizar o PostIt: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Item'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: _isEditing ? _saveDescription : _toggleEditing,
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: MyCartToList(
            onLongPress: (){},
            id: _blocoDeNotas.id.toString(),
            title: _blocoDeNotas.title,
            description: _blocoDeNotas.description,
            isEditing: _isEditing,
            titleController: _titleController,
            descriptionController: _descriptionController,
            onTitleChanged: (newTitle) {
              setState(() {
                _blocoDeNotas.title = newTitle;
              });
            },
            onDescriptionChanged: (newDescription) {
              setState(() {
                _blocoDeNotas.description = newDescription;
              });
            },
            onTap: () {
              if (!_isEditing) {
                _toggleEditing();
              }
            },
          ),
        ),
      ),
    );
  }
}
