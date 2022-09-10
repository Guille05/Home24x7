import '../../businessModels/businessModelDDD.dart';
import '../../daos/ddd/dataModelDDD.dart';
import '../../framework/adapter.dart';

class AdapterDDD extends Adapter<BusinessModelDDD, DataModelDDD> {
  @override
  Future<BusinessModelDDD> createBusinessModel(DataModelDDD? dataModel) async {
    if (dataModel == null)
      return BusinessModelDDD.vazio();
    else
      return BusinessModelDDD(
        ddd: dataModel.ddd,
        uf: dataModel.uf,
      );
  }

  @override
  Future<DataModelDDD> createDataModel(BusinessModelDDD businessModel) async {
    return DataModelDDD(
      ddd: businessModel.ddd,
      uf: businessModel.uf,
    );
  }
}
