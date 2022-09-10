
import '../../businessModels/businessModelPrestadorDeServicoxTipoDeServico.dart';
import '../../daos/prestadorDeServicoXTipoDeServico/dataModelPrestadorDeServicoXTipoDeServico.dart';
import '../../framework/adapter.dart';

class AdapterPrestadorDeServicoXTipoDeServico extends Adapter<BusinessModelPrestadorDeServicoXTipoDeServico, DataModelPrestadorDeServicoXTipoDeServico> {
  @override
  Future<BusinessModelPrestadorDeServicoXTipoDeServico> createBusinessModel(DataModelPrestadorDeServicoXTipoDeServico? dataModel) async {
    if (dataModel == null)
      return BusinessModelPrestadorDeServicoXTipoDeServico.vazio();
    else
      return BusinessModelPrestadorDeServicoXTipoDeServico(
        codPrestadorDeServico: dataModel.codPrestadorDeServico,
        codTipoDeServico: dataModel.codTipoDeServico,
      );
  }

  @override
  Future<DataModelPrestadorDeServicoXTipoDeServico> createDataModel(BusinessModelPrestadorDeServicoXTipoDeServico businessModel) async {
    return DataModelPrestadorDeServicoXTipoDeServico(
      codPrestadorDeServico: businessModel.codPrestadorDeServico,
      codTipoDeServico: businessModel.codTipoDeServico,
    );
  }
}
