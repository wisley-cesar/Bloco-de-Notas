import 'package:flutter/material.dart';
import 'package:bloco_de_notas/model/bloco_de_notas.dart';
import 'package:bloco_de_notas/widgets/My_Card/my_cart_to_list.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  late BlocoDeNotas argumento;
  late TextEditingController _controller;
  bool _isEditing = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    argumento = ModalRoute.of(context)!.settings.arguments as BlocoDeNotas;
    _controller = TextEditingController(text: argumento.description);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveDescription() {
    setState(() {
      argumento.description = _controller.text;
      // Aqui você pode adicionar a chamada para a API para salvar a alteração
      _isEditing = false;
    });
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
          height: argumento.description.length * 2 < 200
              ? 300
              : argumento.description.length * 2,
          child: MyCartToList(
            id: argumento.id,
            title: argumento.title,
            description: argumento.description,
            isEditing: _isEditing,
            controller: _controller,
            onDescriptionChanged: (newDescription) {
              setState(() {
                // Atualiza a descrição localmente
                argumento.description = newDescription;
              });
            },
            onTap: () {
              if (!_isEditing) {
                _toggleEditing(); // Ativa o modo de edição ao clicar
              }
            },
          ),
        ),
      ),
    );
  }
}
