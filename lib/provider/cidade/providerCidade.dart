import 'dart:convert';

import 'package:flutter/services.dart';

import '../../businessModels/businessModelCidade.dart';
import '../../framework/provider.dart';
import '../../util/resposta_processamento.dart';

class ProviderCidade extends Provider<BusinessModelCidade> {
  @override
  Future<BusinessModelCidade> getBusinessModel(String id) {
    // TODO: implement getBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<List<BusinessModelCidade>> getBusinessModels() async {
    final String response =
        await rootBundle.loadString('lib/daos/cidade/cidades.json');
    Map<String, dynamic> data = await json.decode(response);

    List<dynamic> estados = data["estados"];
    List<BusinessModelCidade> listacidades = [];

    for (int j = 0; j < estados.length; j++) {
      String sigla = estados[j]["sigla"];
      List<dynamic> cidades = estados[j]["cidades"];
      for (int i = 0; i < cidades.length; i++) {
        String nome = cidades[i] + " - " + sigla;

        listacidades.add(BusinessModelCidade(
            codCidade: i, nome: nome, totalPrestadoresServico: 0));
      }
    }

    return listacidades;
  }

  @override
  Future<RespostaProcessamento> removeBusinessModel(businessModel) {
    // TODO: implement removeBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> saveBusinessModel(businessModel) {
    // TODO: implement saveBusinessModel
    throw UnimplementedError();
  }
}

// pegar um ou mais datamoveis(dao) e devolver business models