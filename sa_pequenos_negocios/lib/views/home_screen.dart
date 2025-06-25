import 'package:flutter/material.dart';
import 'package:sa_pequenos_negocios2/controllers/produto_controller.dart';
import 'package:sa_pequenos_negocios2/models/produto_model.dart';
import 'package:sa_pequenos_negocios2/views/Produto_cadastro.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final _ProdutoController = ProdutoController();
  List<Produto> _produtos = [];
  bool _isLoading = true;

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
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ID: ${produto.id}"),
                          Text("Descrição: ${produto.descricao}"),
                          Text("Preço de Custo: ${produto.precoCusto}"),
                          Text("Preço de Venda: ${produto.precoVenda}"),
                          Text("Quantidade: ${produto.quantidade}"),
                        ],
                      ),
                    );
                  }
                ),
              ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 50),
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