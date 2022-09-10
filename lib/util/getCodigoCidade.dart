
import '../businessModels/businessModelCidade.dart';
import 'cidade.dart';

class GetCodCidade {
  String nomeCidade;
  GetCodCidade({required this.nomeCidade});
  Future<int> action() async {
    int response = 0;

    List<BusinessModelCidade> listaDeTodasAsCidades =
        Cidades().listaDeTodasAsCidades;

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
