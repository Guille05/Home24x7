import '../../businessModels/businessModelPrestadorInfomation.dart';
import '../../daos/prestadorInformation/dataModePrestadorInformation.dart';
import '../../framework/adapter.dart';

class AdapterPrestadorInformation extends Adapter<
    BusinessModelPrestadorInformation, DataModelPrestadorInformation> {
  @override
  Future<BusinessModelPrestadorInformation> createBusinessModel(
      DataModelPrestadorInformation? dataModel) async {
    if (dataModel == null)
      return BusinessModelPrestadorInformation.vazio();
    else
      return BusinessModelPrestadorInformation(
        IdUsuario: dataModel.IdUsuario,
        phone: dataModel.phone,
        city: dataModel.city,
        description: dataModel.description,
        roles: dataModel.roles,
        workingHours: dataModel.workingHours,
        nome: dataModel.name,
      );
  }

  @override
  Future<DataModelPrestadorInformation> createDataModel(
      BusinessModelPrestadorInformation businessModel) async {
    return DataModelPrestadorInformation(
      phone: businessModel.phone,
      city: businessModel.city,
      description: businessModel.description,
      roles: businessModel.roles,
      workingHours: businessModel.workingHours,
      brazilianID: '',
      brazilianIDPicture: '',
      IdUsuario: businessModel.IdUsuario,
      name: businessModel.nome,
      profilePicture: '',
    );
  }
}
