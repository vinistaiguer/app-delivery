import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetZipCode {
  Future<void> getZipCode(String cep,
      TextEditingController stateController,
      TextEditingController cityController,
      TextEditingController neighborhoodController,
      TextEditingController addressController,
      TextEditingController numberController,
      TextEditingController complementController) async {
    String url = 'https://viacep.com.br/ws/$cep/json/';
    http.Response response;

    if (cep.isNotEmpty) {
      try {
        response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          String responseBody = response.body;
          Map<String, dynamic> data = json.decode(responseBody);

          if (data.containsKey('erro')) {
            throw Exception('CEP não encontrado');
          }

          stateController.text = data['uf'];
          cityController.text = data['localidade'];
          neighborhoodController.text = data['bairro'];
          addressController.text = data['logradouro'];
          numberController.text = '';
          complementController.text = '';
        } else {
          throw Exception('Falha ao buscar CEP');
        }
      } catch (e) {
        throw Exception('Ocorreu um erro ao buscar as informações do CEP: $e');
      }
    } else {
      throw Exception('Por favor, insira um CEP válido antes de buscar.');
    }
  }
}