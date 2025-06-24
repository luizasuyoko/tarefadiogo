import 'package:flutter/material.dart';
import 'package:sa_negocios/controllers/produto_controller.dart';
import 'package:sa_negocios/models/produto_model.dart';
import 'package:sa_negocios/views/produto_cadastro.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final _ProdutoController = ProdutoController();
  List<Produto> _produtos = [];
  bool _isLoading = true;

  final TextEditingController _nomeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  _carregarDados() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _produtos = await _ProdutoController.readProduto();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("exception: $e"),));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _adicionarProduto() async {
    if (_nomeController.text.isEmpty) return;
    // Crie um Produto com valores padrão para os outros campos
    Produto novoProduto = Produto(
      id: 0, // ou null, dependendo do tipo e da lógica do seu modelo
      nome: _nomeController.text,
      descricao: '', // ou forneça uma descrição padrão
      precoCusto: 0,
      precoVenda: 0,
      quantidade: 0,
    );
    await _ProdutoController.createProduto(novoProduto);
    _nomeController.clear();
    _carregarDados();
  }

  //buildar a tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pequeno Negócios"), centerTitle: true,),
    body: Stack(
      children: [
        _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.all(2),
                child: ListView.builder(
                  itemCount: _produtos.length,
                  itemBuilder: (context, index) {
                    final produto = _produtos[index];
                    return ListTile(
                      title: Text(produto.nome),
                      subtitle: Text("ID: ${produto.id}"),
                    );
                  }
                ),
              ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 500),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16),
                FloatingActionButton(
                  tooltip: "Adicionar novo produto",
                  child: Icon(Icons.arrow_forward), // Alterado de Icons.add para Icons.arrow_forward
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProdutoCadastro())
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
  }
}