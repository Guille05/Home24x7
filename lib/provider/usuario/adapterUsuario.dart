
import '../../businessModels/businessModelUsuario.dart';
import '../../daos/usuario/dataModelUsuario.dart';
import '../../framework/adapter.dart';

class AdapterUsuario extends Adapter<BusinessModelUsuario, DataModelUsuario> {
  @override
  Future<BusinessModelUsuario> createBusinessModel(DataModelUsuario? dataModel) async {
    if (dataModel == null)
      return BusinessModelUsuario.vazio();
    else
      return BusinessModelUsuario(
        email: dataModel.email,
        nome: dataModel.nome,
      );
  }

  @override
  Future<DataModelUsuario> createDataModel(BusinessModelUsuario businessModel) async {
    return DataModelUsuario(
      email: businessModel.email,
      nome: businessModel.nome,

    );
  }
}
