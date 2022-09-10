import '../../businessModels/businessModelPrestadorDeServicos.dart';
import '../../businessModels/businessModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import '../../daos/prestadoresDeServicoPorCidadeTipoDeServico/dataModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import '../../daos/worker/dataModelPrestadorDeServicos.dart';
import '../../framework/adapter.dart';
import '../cidade/adapterCidade.dart';
import '../prestadorDeServico/adapterPrestadorDeServico.dart';
import '../tiposDeServico/adapterTipoDeServico.dart';

class AdapterPrestadoresDeServicoPorCidadeTipoDeServico extends Adapter<BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico, DataModelPrestadoresDeServicoPorCidadeTipoDeServico> {
  Future<BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico> createBusinessModel(DataModelPrestadoresDeServicoPorCidadeTipoDeServico? dataModelPrestadorDeServicos) async {
    if (dataModelPrestadorDeServicos == null) {
      return BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico.vazio();
    }
    return BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico(
      cidade: await AdapterCidade().createBusinessModel(dataModelPrestadorDeServicos.cidade),
      tipoDeServico: await AdapterTipoDeServico().createBusinessModel(dataModelPrestadorDeServicos.tipoServico),
      prestadoresDeServico: await _getPrestadoresDeServicosoFromJson(dataModelPrestadorDeServicos.prestadoresServico),
    );
  }

  Future<List<BusinessModelPrestadorDeServicos>> _getPrestadoresDeServicosoFromJson(List<DataModelPrestadorDeServicos> dataModels) async {
    List<BusinessModelPrestadorDeServicos> lista = List.empty(growable: true);
    for (var dataModel in dataModels) {
      lista.add(await AdapterPrestadorDeServico().createBusinessModel(dataModel));
    }
    return lista;
  }

  @override
  Future<DataModelPrestadoresDeServicoPorCidadeTipoDeServico> createDataModel(BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico businessModel) async {
    return DataModelPrestadoresDeServicoPorCidadeTipoDeServico(
      cidade: await AdapterCidade().createDataModel(businessModel.cidade),
      tipoServico: await AdapterTipoDeServico().createDataModel(businessModel.tipoDeServico),
      prestadoresServico: List.empty(growable: true),
    );
  }
}
