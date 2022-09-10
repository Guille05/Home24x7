import 'package:flutter/cupertino.dart';

import '../../businessModels/businessModelCidade.dart';
import '../../businessModels/businessModelPrestadorDeServicos.dart';
import '../../businessModels/businessModelTiposDeServico.dart';
import '../../framework/viewModelLista.dart';

class ViewModelListaPrestadoresDeServico extends ViewModelLista<BusinessModelPrestadorDeServicos> {
  final BusinessModelCidade cidade;
  final BusinessModelTiposDeServico tiposDeServico;
  final TextEditingController controlerFieldPesquisa = TextEditingController();

  ViewModelListaPrestadoresDeServico({
    required List<BusinessModelPrestadorDeServicos> listaCompleta,
    required this.cidade,
    required this.tiposDeServico,
  }) : super(listaVisivel: List.empty(growable: true)..addAll(listaCompleta), listaCompleta: listaCompleta);
}
