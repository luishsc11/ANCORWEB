import 'package:ancorwebseguro/shared/card_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detalhes_caixa extends StatelessWidget {
  final String nome;
  final String datanasc;
  final String cpf;
  final String civil;
  final String endereco;
  final String principalcond;
  final String menorvintecinco;
  final String fabricacao;
  final String modelo;
  final String placa;
  final String chassi;
  final String combustivel;
  final String email;
  final String celular;
  final String wpp;

  Detalhes_caixa({
    super.key,
    required this.nome,
    required this.datanasc,
    required this.cpf,
    required this.civil,
    required this.endereco,
    required this.principalcond,
    required this.menorvintecinco,
    required this.fabricacao,
    required this.modelo,
    required this.placa,
    required this.chassi,
    required this.combustivel,
    required this.email,
    required this.celular,
    required this.wpp,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('DETALHES', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Card_info.showDescription(
            nome: nome,
            datanasc: datanasc,
            cpf: cpf,
            civil: civil,
            endereco: endereco,
            principalcond: principalcond,
            menorvintecinco: menorvintecinco,
            fabricacao: fabricacao,
            modelo: modelo,
            placa: placa,
            chassi: chassi,
            combustivel: combustivel,
            email: email,
            celular: celular,
            wpp: wpp,
          ),
          SizedBox(
            height: 105,
          ),
        ]),
      ),
    );
  }
}
