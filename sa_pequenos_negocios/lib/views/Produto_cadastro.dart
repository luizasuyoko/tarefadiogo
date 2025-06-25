import 'package:flutter/material.dart';
import 'package:sa_pequenos_negocios2/controllers/produto_controller.dart';
import 'package:sa_pequenos_negocios2/models/produto_model.dart';
import 'package:sa_pequenos_negocios2/views/Home_screen.dart';

class ProdutoCadastro extends StatefulWidget {
  const ProdutoCadastro({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProdutoCadastroScreenState();
  }
}

class _ProdutoCadastroScreenState extends State<ProdutoCadastro> {
  final _formKey = GlobalKey<FormState>();
  final _produtoController = ProdutoController();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _precoCustoController = TextEditingController(); 
  final TextEditingController _precoVendaController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();

  _salvarProduto() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newProduto = Produto(
        nome: _nomeController.text,
        descricao: _descricaoController.text,
        precoCusto: int.tryParse(_precoCustoController.text) ?? 0,
        precoVenda: int.tryParse(_precoVendaController.text) ?? 0,
        quantidade: int.tryParse(_quantidadeController.text) ?? 0,
      );

      await _produtoController.createProduto(newProduto);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Produto cadastrado com sucesso!")),
      );
    }
    _nomeController.clear();
    _descricaoController.clear();
    _precoCustoController.clear();
    _precoVendaController.clear();
    _quantidadeController.clear();
    await Future.delayed(Duration(seconds: 1));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Produto")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: "Nome do Produto"),
                validator: (String? value) =>
                    value == null || value.isEmpty ? "Campo não preenchido" : null,
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: "Descrição"),
                validator: (String? value) =>
                    value == null || value.isEmpty ? "Campo não preenchido" : null,
              ),
              TextFormField(
                controller: _precoCustoController,
                decoration: InputDecoration(labelText: "Preço de Custo"),
                keyboardType: TextInputType.number,
                validator: (String? value) =>
                    value == null || value.isEmpty ? "Campo não preenchido" : null,
              ),
              TextFormField(
                controller: _precoVendaController,
                decoration: InputDecoration(labelText: "Preço de Venda"),
                keyboardType: TextInputType.number,
                validator: (String? value) =>
                    value == null || value.isEmpty ? "Campo não preenchido" : null,
              ),
              TextFormField(
                controller: _quantidadeController,
                decoration: InputDecoration(labelText: "Quantidade"),
                keyboardType: TextInputType.number,
                validator: (String? value) =>
                    value == null || value.isEmpty ? "Campo não preenchido" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _salvarProduto,
                child: Text("Cadastrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}