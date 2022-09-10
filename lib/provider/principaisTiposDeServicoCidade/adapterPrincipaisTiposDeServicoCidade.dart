
import '../../businessModels/businessModelCidade.dart';
import '../../businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import '../../businessModels/businessModelTiposDeServico.dart';
import '../../daos/principaisTiposDeServicoCidade/dataModelPrincipaisTiposDeServicoCidade.dart';
import '../../framework/adapter.dart';
import '../cidade/adapterCidade.dart';
import '../tiposDeServico/adapterTipoDeServico.dart';

class AdapterPrincipaisTiposDeServicoCidade extends Adapter<BusinessModelPrincipaisTiposDeServicoCidade, DataModelPrincipaisTiposDeServicoCidade> {
  @override
  Future<BusinessModelPrincipaisTiposDeServicoCidade> createBusinessModel(DataModelPrincipaisTiposDeServicoCidade? dataModel) async {
    if (dataModel == null)
      return BusinessModelPrincipaisTiposDeServicoCidade.vazio();
    else {
      List<BusinessModelTiposDeServico> tiposDeServico = List.empty(growable: true);
      for (int i = 0; i < dataModel.tiposDeServico.length; i++) {
        BusinessModelTiposDeServico businessModelTiposDeServico = await AdapterTipoDeServico().createBusinessModel(dataModel.tiposDeServico[i]);
        tiposDeServico.add(businessModelTiposDeServico);
      }

      BusinessModelCidade cidade = await AdapterCidade().createBusinessModel(dataModel.cidade);

      return BusinessModelPrincipaisTiposDeServicoCidade(
        cidade: cidade,
        tiposDeServico: tiposDeServico,
      );
    }
  }

  @override
  Future<DataModelPrincipaisTiposDeServicoCidade> createDataModel(BusinessModelPrincipaisTiposDeServicoCidade businessModel) async {
    List<int> principaisTiposDeServico = List.empty(growable: true);
    businessModel.tiposDeServico.forEach((tipoDeServico) {
      principaisTiposDeServico.add(tipoDeServico.codTipoServico);
    });
    return DataModelPrincipaisTiposDeServicoCidade(
      cidade: await AdapterCidade().createDataModel(businessModel.cidade),
      tiposDeServico: List.empty(growable: true),
    );
  }
}
