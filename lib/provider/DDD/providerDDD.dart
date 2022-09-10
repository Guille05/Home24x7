import '../../businessModels/businessModelDDD.dart';
import '../../daos/ddd/daoDDD.dart';
import '../../daos/ddd/dataModelDDD.dart';
import '../../framework/providerDireto.dart';
import 'adapterDDD.dart';

class ProviderDDD extends ProviderDireto<DataModelDDD, BusinessModelDDD, DaoDDD, AdapterDDD> {
  ProviderDDD() : super(dao: DaoDDD(), adapter: AdapterDDD());

  List<int> getCodigosDDDs() {
    return dao.getCodigosDDDs();
  }
}
