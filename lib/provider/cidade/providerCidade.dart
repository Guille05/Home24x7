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
    Map<String, dynamic> data = {
      "estados": [
        {
          "sigla": "FL",
          "nome": "Florida",
          "cidades": [
            "Jacksonville",
            "Miami",
            "Tampa",
            "Orlando",
            "St. Petesburg",
            "Hialeah",
            "Port St. Lucie",
            "Cape Coral",
            "Tallahassee",
            "Pembroke Pines",
            "Hollywood",
            "Gainesville",
            "Miramar",
            "Coral Springs"
          ]
        },
        {
          "sigla": "GA",
          "nome": "Georgia",
          "cidades": [
            "Atlanta",
            "Columbus",
            "Macon-Bibb County",
            "Savannah",
            "South Fulton",
            "Sandy Springs",
            "Roswell",
            "Johns Creek",
            "Warner Robins",
            "Albany",
            "Alpharetta",
            "Marietta",
            "Stonecrest",
            "Smyrna",
            "Valdosta"
          ]
        },
        {
          "sigla": "AL",
          "nome": "Alabama",
          "cidades": [
            "Huntsville",
            "Montgomery",
            "Birmingham",
            "Mobile",
            "Tuscaloosa",
            "Hoover",
            "Auburn",
            "Dothan",
            "Madison",
            "Decatur",
            "Florence",
            "Vestavia Hills",
            "Phoenix City",
            "Prattville",
            "Gadsden"
          ]
        },
        {
          "sigla": "SC",
          "nome": "South Carolina",
          "cidades": [
            "Charleston",
            "Columbia",
            "North Charleston",
            "Mount Pleasant",
            "Rock Hill",
            "Summerville",
            "Goose Creek",
            "Sumter",
            "Florence",
            "Greer",
            "Spartanburg",
            "Hilton Head Island",
            "Myrtle Beach",
            "Bluffton"
          ]
        },
        {
          "sigla": "MS",
          "nome": "Mississippi",
          "cidades": [
            "Jackson",
            "Gulfport",
            "Southhaven",
            "Biloxi",
            "Hattiesburg",
            "Olive Branch",
            "Tupelo",
            "Meridian",
            "Greenville",
            "Madison",
            "Clinton",
            "Pearl",
            "Horn Lake",
            "Oxford",
            "Brandon"
          ]
        }
      ]
    };

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