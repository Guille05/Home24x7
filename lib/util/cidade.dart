
/*
import 'package:flutter/cupertino.dart';

import '../businessModels/businessModelCidade.dart';
import '../provider/cidade/providerCidade.dart';

class Cidades {
  static final Cidades _singleton = Cidades._internal();
  List<BusinessModelCidade> listaDeTodasAsCidades = [];

  factory Cidades() {
    return _singleton;
  }

  Future<void> getCidades() async {
    listaDeTodasAsCidades = await ProviderCidade().getBusinessModels() as List<BusinessModelCidade>;
  }

  Cidades._internal();
}
*/

/*


import 'package:flutter/cupertino.dart';

import '../businessModels/businessModelCidade.dart';
import '../provider/cidade/providerCidade.dart';

class CitiePrvider with ChangeNotifier {

  static final CitieProvider provider = CitieProvider._internal();

  List<BusinessModelCidade> listaDeTodasAsCidades = [];

  factory CitieProvider() {
    return provider;
  }

  Future<void> getCidades() async {
    listaDeTodasAsCidades = await ProviderCidade().getBusinessModels() as List<BusinessModelCidade>;
  }
  CitieProvider._internal();

}
*/
