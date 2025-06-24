import 'package:flutter/material.dart';
import 'package:sa_negocios/views/produto_cadastro.dart';
import 'package:sa_negocios/views/home_screen.dart';

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