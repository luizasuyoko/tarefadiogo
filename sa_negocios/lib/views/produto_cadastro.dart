
import 'package:flutter/material.dart';
import 'package:sa_negocios/controllers/produto_controller.dart';
import 'package:sa_negocios/models/produto_model.dart';
import 'package:sa_negocios/views/home_screen.dart';

class ProdutoCadastro extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ProdutoCadastroScreenState();
  }
}

class _ProdutoCadastroScreenState extends State<ProdutoCadastro>{
  final TextEditingController _nomeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _petsController = ProdutoController();

  //late
  late String _nome;
  late int _precoVenda;
  late int _precoCusto;
  late int _quantidade;
  late String _descricao;

  _salvarProduto() async{
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      final newProduto = Produto(
        nome: _nome, 
        precoCusto: _precoCusto, 
        precoVenda: _precoVenda,
        quantidade: _quantidade,
        descricao: _descricao
      );
      await _petsController.createProduto(newProduto);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen()));
    }
  }

  //buildar a screen 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Produto"),),
      body: Padding(padding: EdgeInsets.all(16),
      child: Form(key: _formKey ,child: ListView(
        children: [
          TextFormField(
          decoration: InputDecoration(labelText: "Nome do Produto"),
          validator: (value) => value!.isEmpty ? "Campo nao preenchido":null,
          onSaved: (newValue) => _nome = newValue!,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Descrição"),
          validator: (value) => value!.isEmpty ? "Campo nao preenchido":null,
          onSaved: (newValue) => _nome = newValue!,
        ),TextFormField(
          decoration: InputDecoration(labelText: "Preço de Custo"),
          validator: (value) => value!.isEmpty ? "Campo nao preenchido": null,
          onSaved: (newValue) => _nome = newValue!,
        ),TextFormField(
          decoration: InputDecoration(labelText: "Preço de Venda"),
          validator: (value) => value!.isEmpty ? "Campo nao preenchido": null,
          onSaved: (newValue) => _nome = newValue!,
        ),TextFormField(
          decoration: InputDecoration(labelText: "Quantidade"),
          validator: (value) => value!.isEmpty ? "Campo nao preenchido":null,
          onSaved: (newValue) => _nome = newValue!,
        ),
        ElevatedButton(onPressed: _salvarProduto, child: Text("Cadastrar"))
        ],
      )),
      ),
    );
  }
}