import 'package:flutter/material.dart';
import 'package:sa_pequenos_negocios2/views/Home_screen.dart';
import 'package:sa_pequenos_negocios2/views/Produto_cadastro.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/home",
    routes: {
      "/home": (context) => HomeScreen(),
      "/cadastro": (context) => ProdutoCadastro(),
    },
  ));
}