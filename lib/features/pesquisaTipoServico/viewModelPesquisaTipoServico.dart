import 'package:flutter/cupertino.dart';
import 'package:home24x7/businessModels/businessModelTiposDeServico.dart';
import 'package:home24x7/framework/viewModelLista.dart';

import '../../framework/viewModelLista.dart';



class ViewModelPesquisaTipoServico extends ViewModelLista<BusinessModelTiposDeServico> {
  final TextEditingController controlerFieldPesquisa = TextEditingController();
  String mensagemDeErro = '';

  ViewModelPesquisaTipoServico({
    required List<BusinessModelTiposDeServico> listaCompleta,
  }) : super(listaVisivel: List.empty(growable: true)..addAll(listaCompleta), listaCompleta: listaCompleta);

}
