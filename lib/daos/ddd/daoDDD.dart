import 'package:home24x7/framework/daoPadrao.dart';


import 'dataModelDDD.dart';

class DaoDDD extends DaoPadrao<DataModelDDD> {
  DaoDDD() : super(dados: _dados);

  List<int> getCodigosDDDs() {
    List<int> listaCodigosDosDDDs = List.empty(growable: true);
    for (int posicao = 0; posicao < _dados.length; posicao++) {
      DataModelDDD dataModelDDD = _dados[posicao];
      listaCodigosDosDDDs.add(dataModelDDD.ddd);
    }
    return listaCodigosDosDDDs;
  }

  static List<DataModelDDD> _dados = List.empty(growable: true)
    ..add(DataModelDDD(
      ddd: 11,
      uf: "SP",
    ))
    ..add(DataModelDDD(
      ddd: 27,
      uf: "ES",
    ));
}