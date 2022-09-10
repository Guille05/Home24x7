import '../../businessModels/businessModelPrestadorDeServicoxCidade.dart';
import '../../daos/prestadorDeServicoXCidade/daoPrestadorDeServicoXCidade.dart';
import '../../daos/prestadorDeServicoXCidade/dataModelPrestadorDeServicoXCidade.dart';
import '../../framework/providerDireto.dart';
import 'adapterPrestadorDeServicoXCidade.dart';

class ProviderPrestadorDeServicoXCidade extends ProviderDireto<DataModelPrestadorDeServicoXCidade, BusinessModelPrestadorDeServicoXCidade, DaoPrestadorDeServicoXCidade, AdapterPrestadorDeServicoXCidade> {
  ProviderPrestadorDeServicoXCidade() : super(adapter: AdapterPrestadorDeServicoXCidade(), dao: DaoPrestadorDeServicoXCidade());

  int getQuantidadePrestadoresCidade(int codCidade) {
    return dao.getQuantidadePrestadoresCidade(codCidade);
  }
}
