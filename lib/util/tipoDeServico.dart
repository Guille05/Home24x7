/*

import 'package:flutter/cupertino.dart';
import '../businessModels/businessModelTiposDeServico.dart';
import '../provider/tiposDeServico/providerTiposDeServico.dart';

class ProviderService with ChangeNotifier {

  static final ProviderService provider = ProviderService._internal();

  List<BusinessModelTiposDeServico> listaTodosPrestadores = [];

  factory ProviderService() {
    return provider;
  }

  Future<void> getTiposDeServico() async {
    listaTodosPrestadores = await ProviderTiposDeServico().getBusinessModels();
  }

  ProviderService._internal();

}

*/
