import 'package:flutter/material.dart';

class Card_info extends StatelessWidget {
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
  bool showDescription = false;

  Card_info({
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

  Card_info.showDescription({
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
  }) : showDescription = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xFFE5D9D9)),
      padding: EdgeInsets.only(top: 9, bottom: 10, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: showDescription
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            nome,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          if (showDescription)
            Column(
              children: [
                SizedBox(height: 9),
                Text(
                  modelo,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          SizedBox(height: 9),
          Text(
            celular,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
