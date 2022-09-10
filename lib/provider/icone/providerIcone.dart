
import '../../businessModels/businessModelIcone.dart';
import '../../daos/icon/daoIcone.dart';
import '../../daos/icon/dataModelIcone.dart';
import '../../framework/providerDireto.dart';
import 'adapterIcone.dart';

class ProviderIcone extends ProviderDireto<DataModelIcone, BusinessModelIcone, DaoIcone, AdapterIcone> {
  ProviderIcone()
      : super(
          dao: DaoIcone(),
          adapter: AdapterIcone(),
        );

  Future<BusinessModelIcone> whatsApp() {
    return this.getBusinessModel("whatsApp");
  }

  Future<BusinessModelIcone> statusOnline() {
    return this.getBusinessModel("statusOnline");
  }

  Future<BusinessModelIcone> Cidade() {
    return this.getBusinessModel("cidades");
  }

  Future<BusinessModelIcone> iconeCelular() {
    return this.getBusinessModel("cidades");
  }
}
