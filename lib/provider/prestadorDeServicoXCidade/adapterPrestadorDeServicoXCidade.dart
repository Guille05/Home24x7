
import '../../businessModels/businessModelPrestadorDeServicoxCidade.dart';
import '../../daos/prestadorDeServicoXCidade/dataModelPrestadorDeServicoXCidade.dart';
import '../../framework/adapter.dart';

class AdapterPrestadorDeServicoXCidade extends Adapter<BusinessModelPrestadorDeServicoXCidade, DataModelPrestadorDeServicoXCidade> {
  @override
  Future<BusinessModelPrestadorDeServicoXCidade> createBusinessModel(DataModelPrestadorDeServicoXCidade? dataModel) async {
    if (dataModel == null)
      return BusinessModelPrestadorDeServicoXCidade.vazio();
    else
      return BusinessModelPrestadorDeServicoXCidade(
        codPrestadorDeServico: dataModel.codPrestadorDeServico,
        codCidade: dataModel.codCidade,
      );
  }

  @override
  Future<DataModelPrestadorDeServicoXCidade> createDataModel(BusinessModelPrestadorDeServicoXCidade businessModel) async {
    return DataModelPrestadorDeServicoXCidade(
      codPrestadorDeServico: businessModel.codPrestadorDeServico,
      codCidade: businessModel.codCidade,
    );
  }
}
