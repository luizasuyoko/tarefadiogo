class Produto{
  //atributos
  final int? id; 
  final String nome;
  final int precoVenda;
  final int precoCusto;
  final int quantidade;
  final String descricao;

  //construtor
  Produto({
    this.id,
    required this.nome,
    required this.precoVenda,
    required this.precoCusto,
    required this.quantidade,
    required this.descricao    
  });

  Map<String, dynamic> toMap(){
    return{
      "id":id,
      "nome":nome,
      "preco_venda":precoVenda,
      "preco_custo":precoCusto,
      "quantidade":quantidade,
      "descricao": descricao
    };
  }

  static Produto fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'],
      nome: map['nome'],
      precoCusto: map['preco_custo'],
      precoVenda: map['preco_venda'],
      quantidade: map['quantidade'],
      descricao: map['descricao']
    );
  }

  Produto copyWith({required int id}) {
    return Produto(
      id: id,
      nome: this.nome,
      precoVenda: this.precoVenda,
      precoCusto: this.precoCusto,
      quantidade: this.quantidade,
      descricao: this.descricao,
    );
  }
}