import 'package:sa_pequenos_negocios2/models/produto_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _database;
  static final DbHelper _instance = DbHelper._internal();
  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database> get database async{
    if (_database != null){
      return _database!;
    }else{
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    //pegar o endereco do banco de dados
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "negocios.db"); //caminho completo para o banco de dados

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreateDb
    );
  }

  Future<void> _onCreateDb(Database db, int version) async{
    await db.execute(
      """
        CREATE TABLE IF NOT EXISTS produtos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL, 
        preco_custo INTEGER NOT NULL, 
        preco_venda INTEGER NOT NULL,
        quantidade INTEGER NOT NULL)
      """
    );
    print("tabela produtos criada");
  }

  Future<int> insertProduto(Produto produto) async{
    final db = await database;
    return await db.insert("produtos", produto.toMap());
  }

  Future<List<Produto>> getProdutos() async{
    final db = await database; 
    final List<Map<String, dynamic>> maps = await db.query("produtos");
    return maps.map((e) => Produto.fromMap(e)).toList();
  }

  Future<Produto?> getProdutobyId(int id) async{
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("produtos", where: "id=?", whereArgs: [id]);

    if(maps.isNotEmpty){
      return Produto.fromMap(maps.first);
    } else{
      return null;
    }
  }

  Future<int> deleteProduto(int id) async{
    final db = await database;
    return await db.delete("produtos", where: "id=?", whereArgs: [id]);
  }
}