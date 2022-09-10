
import '../../businessModels/businessModelCidade.dart';
import '../../daos/city/dataModelCidade.dart';
import '../../framework/adapter.dart';

class AdapterCidade extends Adapter<BusinessModelCidade, DataModelCidade> {
  @override
  Future<BusinessModelCidade> createBusinessModel(DataModelCidade? dataModel) async {
    if (dataModel == null)
      return BusinessModelCidade.vazio();
    else
      return BusinessModelCidade(
        codCidade: dataModel.codCidade,
        nome: dataModel.nome,
        totalPrestadoresServico: dataModel.totalPrestadoresServico,
      );
  }

  @override
  Future<DataModelCidade> createDataModel(BusinessModelCidade businessModel) async {
    return DataModelCidade(
      codCidade: businessModel.codCidade,
      nome: businessModel.nome,
      totalPrestadoresServico: businessModel.totalPrestadoresServico,
    );
  }
}

// coverte datamodel para business model (