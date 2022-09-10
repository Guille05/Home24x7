
import '../businessModels/businessModelTiposDeServico.dart';
import '../provider/tiposDeServico/providerTiposDeServico.dart';

class TipoDeServico {
  static final TipoDeServico _singleton = TipoDeServico._internal();
  List<BusinessModelTiposDeServico> listaTodosPrestadores = [];

  factory TipoDeServico() {
    return _singleton;
  }

  Future<void> getTiposDeServico() async {
    listaTodosPrestadores = await ProviderTiposDeServico().getBusinessModels();
  }

  TipoDeServico._internal();
}
