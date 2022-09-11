
import '../../businessModels/businessModelTiposDeServico.dart';
import '../../daos/tiposDeServico/daoTipoDeServico.dart';
import '../../daos/tiposDeServico/dataModelTipoDeServico.dart';
import '../../framework/provider.dart';
import '../../util/getIconeTipoServico.dart';
import '../../util/resposta_processamento.dart';

class ProviderTiposDeServico extends Provider<BusinessModelTiposDeServico> {
  DaoTipoDeServico dao = DaoTipoDeServico();
  GetIconeTipoServico getIconeTipoServico = GetIconeTipoServico(nomeIcon: '');
  @override
  Future<BusinessModelTiposDeServico> getBusinessModel(String id) async {
    List<BusinessModelTiposDeServico> listaTiposDeServico =
    await ProviderTiposDeServico().getBusinessModels();
    return listaTiposDeServico[int.parse(id)];
  }

  @override
  Future<List<BusinessModelTiposDeServico>> getBusinessModels() async {
    // TODO: implement getBusinessModels
    List<BusinessModelTiposDeServico> listaDeTiposDeServico = [];
    List<DataModelTipoDeServico> listaDataModels = [];

    listaDataModels = await dao.getDataModels();
    int index = 0;
    listaDataModels.forEach((element) {
      index++;
      listaDeTiposDeServico.add(BusinessModelTiposDeServico(
          codTipoServico: element.codTipoServico,
          descricao: element.descricao,
          icone: getIconeTipoServico.getIconeTipoServico(element.descricao),
          qtdePrestadoresDeServico: 0));
    });

    print(listaDeTiposDeServico);
    return listaDeTiposDeServico;
  }

  @override
  Future<RespostaProcessamento> removeBusinessModel(
      BusinessModelTiposDeServico businessModel) {
    // TODO: implement removeBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> saveBusinessModel(
      BusinessModelTiposDeServico businessModel) {
    // TODO: implement saveBusinessModel
    throw UnimplementedError();
  }
}
