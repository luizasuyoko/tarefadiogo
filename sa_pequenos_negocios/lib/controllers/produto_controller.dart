import 'package:sa_pequenos_negocios2/models/produto_model.dart';
import 'package:sa_pequenos_negocios2/services/db_helper.dart';

class ProdutoController {
  final DbHelper _dbHelper = DbHelper();

  Future<int> createProduto(Produto produto) async{
    return await _dbHelper.insertProduto(produto);
  }

  Future<List<Produto>> readProduto() async{
    return await _dbHelper.getProdutos();
  }

  Future<Produto?> readProdutobyId(int id) async{
    return await _dbHelper.getProdutobyId(id);
  }

  Future<int> deleteProduto(int id) async{
    return await _dbHelper.deleteProduto(id);
  }
}