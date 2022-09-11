
import 'package:flutter/material.dart';
import '../../businessModels/businessModelCidade.dart';
import '../../businessModels/businessModelDadosPrestador.dart';
import '../../businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import '../../businessModels/businessModelTiposDeServico.dart';
import '../../framework/provider.dart';
import '../../util/getQtdePrestadoresDeServicoPorTipoSeervicoECidade.dart';
import '../../util/resposta_processamento.dart';
import '../cidade/providerCidade.dart';
import '../dadosPrestador/providerDadosPrestador.dart';
import '../tiposDeServico/providerTiposDeServico.dart';

class ProviderPrincipaisTiposDeServicoCidade
    extends Provider<BusinessModelPrincipaisTiposDeServicoCidade> {
  @override
  Future<BusinessModelPrincipaisTiposDeServicoCidade> getBusinessModel(
      String id) async {
    BusinessModelPrincipaisTiposDeServicoCidade
        businessModelPrincipaisTiposDeServicoCidade;

    Future<List<BusinessModelCidade>> getCidades() async {
      List<BusinessModelCidade> listaDeTodasAsCidades = [];

      listaDeTodasAsCidades = await ProviderCidade().getBusinessModels();
      return listaDeTodasAsCidades;
    }

    List<BusinessModelCidade> cidades = await getCidades();
    List<BusinessModelDadosPrestador> prestadores = await ProvideDadosPrestador().getBusinessModels();

    List<BusinessModelDadosPrestador> prestadoresFiltrados = [];
    prestadoresFiltrados = prestadores
        .where((element) => element.city == cidades[int.parse(id)].nome)
        .toList();

    if (prestadoresFiltrados.length < 4) {
      prestadoresFiltrados = prestadores;
    }

    List<BusinessModelTiposDeServico> listBusinessModelTipoDeServico = [];
    prestadoresFiltrados.forEach((element) {
      BusinessModelTiposDeServico tiposDeServico;
      element.roles.forEach((element) async {
        tiposDeServico =
            await ProviderTiposDeServico().getBusinessModel(element.toString());
        listBusinessModelTipoDeServico.add(tiposDeServico);
      });
    });

    List<BusinessModelTiposDeServico> listPrincipaisBusinessModelTipoDeServico =
        [];
    Map mapQuantidadeServicoUmaCidade = {};

    for (int i = 0; i < listBusinessModelTipoDeServico.length; i++) {
      if (mapQuantidadeServicoUmaCidade
          .containsKey(listBusinessModelTipoDeServico[i].codTipoServico)) {
        mapQuantidadeServicoUmaCidade[listBusinessModelTipoDeServico[i]
            .codTipoServico] = mapQuantidadeServicoUmaCidade[
                listBusinessModelTipoDeServico[i].codTipoServico] +
            1;
      } else {
        mapQuantidadeServicoUmaCidade[
            listBusinessModelTipoDeServico[i].codTipoServico] = 1;
      }
    }

    List<int> listaQuantidadePrestadores = [];
    List<String> listKeys = [];

    mapQuantidadeServicoUmaCidade.forEach((key, value) {
      listaQuantidadePrestadores.add(value);
      listBusinessModelTipoDeServico.add(key);
    });

    List<int> listaindexMaiorValor = [];
    for (int i = 0; i < listaQuantidadePrestadores.length; i++) {
      int indexMaiorValor = i;
      for (int j = 0; j < listaQuantidadePrestadores.length; j++) {
        if (listaQuantidadePrestadores[j] >
            listaQuantidadePrestadores[indexMaiorValor]) {
          indexMaiorValor = j;
        }
      }
      listaindexMaiorValor.add(indexMaiorValor);
      listaQuantidadePrestadores[indexMaiorValor] = 0;
    }

    List<String> listKeysOrdenadasFinal = [];

    listaindexMaiorValor.forEach((valor) {
      listKeysOrdenadasFinal.add(listKeys[valor]);
    });

    listKeysOrdenadasFinal.forEach((element) {
      listPrincipaisBusinessModelTipoDeServico.add(BusinessModelTiposDeServico(
          codTipoServico: int.parse(element),
          descricao: '',
          icone: Icons.add,
          qtdePrestadoresDeServico: mapQuantidadeServicoUmaCidade[element]));
    });

    if (listPrincipaisBusinessModelTipoDeServico.length < 4) {
      listPrincipaisBusinessModelTipoDeServico =
          await ProviderTiposDeServico().getBusinessModels();
    }
    //GetQtdePrestadoresDeServicoPorTipoSeervicoECidade
    List<BusinessModelTiposDeServico> finalListTiposDeServico = [];
    for (int i = 0; i < listPrincipaisBusinessModelTipoDeServico.length; i++) {
      int qtePrestadores =
          await GetQtdePrestadoresDeServicoPorTipoSeervicoECidade(
                  idCidade: cidades[int.parse(id)].nome,
                  idServico: listPrincipaisBusinessModelTipoDeServico[i]
                      .codTipoServico)
              .action();
      finalListTiposDeServico.add(BusinessModelTiposDeServico(
        codTipoServico:
            listPrincipaisBusinessModelTipoDeServico[i].codTipoServico,
        descricao: listPrincipaisBusinessModelTipoDeServico[i].descricao,
        icone: listPrincipaisBusinessModelTipoDeServico[i].icone,
        qtdePrestadoresDeServico: qtePrestadores,
      ));
    }
    print(cidades);
    businessModelPrincipaisTiposDeServicoCidade =
        BusinessModelPrincipaisTiposDeServicoCidade(
      cidade: cidades[int.parse(id)],
      tiposDeServico: finalListTiposDeServico,
    );
    return businessModelPrincipaisTiposDeServicoCidade;
  }

  @override
  Future<List<BusinessModelPrincipaisTiposDeServicoCidade>>
      getBusinessModels() {
    // TODO: implement getBusinessModels
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> removeBusinessModel(
      BusinessModelPrincipaisTiposDeServicoCidade businessModel) {
    // TODO: implement removeBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> saveBusinessModel(
      BusinessModelPrincipaisTiposDeServicoCidade businessModel) {
    // TODO: implement saveBusinessModel
    throw UnimplementedError();
  }
}
