
import '../businessModels/businessModelCidade.dart';
import '../provider/cidade/providerCidade.dart';
import '../provider/tiposDeServico/providerTiposDeServico.dart';

class GetCodCidade {
  String nomeCidade;
  List<BusinessModelCidade> listaDeTodasAsCidades = [];

  Future<List<BusinessModelCidade>> getCidades() async {
    listaDeTodasAsCidades = await ProviderCidade().getBusinessModels();
    return listaDeTodasAsCidades;
  }

  GetCodCidade({required this.nomeCidade});
  Future<int> action() async {
    int response = 0;

    List<BusinessModelCidade> listaDeTodasAsCidades = await getCidades();

    print(listaDeTodasAsCidades);
    for (int i = 0; i < listaDeTodasAsCidades.length; i++) {
      if (listaDeTodasAsCidades[i].nome == nomeCidade) {
        response = i;
        return response;
      }
    }
    return response;
  }
}
