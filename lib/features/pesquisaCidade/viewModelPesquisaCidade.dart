import 'package:flutter/cupertino.dart';
import 'package:home24x7/businessModels/businessModelCidade.dart';
import 'package:home24x7/framework/viewModelLista.dart';


import '../../businessModels/businessModelCidade.dart';
import 'featureModelPesquisaCidade.dart';


class ViewModelPesquisaCidade extends ViewModelLista<FeatureModelPesquisaCidade> {
  final TextEditingController controlerFieldPesquisa = TextEditingController();
  String mensagemDeErro = '';

  ViewModelPesquisaCidade({
    required List<FeatureModelPesquisaCidade> listaCompleta,
  }) : super(listaVisivel: List.empty(growable: true)..addAll(listaCompleta), listaCompleta: listaCompleta);

  BusinessModelCidade getCidadePeloCodCidade(int codCidade) {
    for (int i = 0; i < this.listaCompleta.length; i++) {
      if (this.listaCompleta[i].cidade.codCidade == codCidade) return this.listaCompleta[i].cidade;
    }
    return BusinessModelCidade.vazio();
  }
}