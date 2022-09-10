
import '../../businessModels/businessModelPrestadorDeServicoxTipoDeServico.dart';
import '../../daos/prestadorDeServicoXCidade/daoPrestadorDeServicoXCidade.dart';
import '../../daos/prestadorDeServicoXTipoDeServico/daoPrestadorDeServicoXTipoDeServico.dart';
import '../../daos/prestadorDeServicoXTipoDeServico/dataModelPrestadorDeServicoXTipoDeServico.dart';
import '../../framework/providerDireto.dart';
import 'adapterPrestadorDeServicoXTipoDeServico.dart';

class ProviderPrestadorDeServicoXTipoDeServico extends ProviderDireto<DataModelPrestadorDeServicoXTipoDeServico, BusinessModelPrestadorDeServicoXTipoDeServico, DaoPrestadorDeServicoXTipoDeServico, AdapterPrestadorDeServicoXTipoDeServico> {
  ProviderPrestadorDeServicoXTipoDeServico() : super(adapter: AdapterPrestadorDeServicoXTipoDeServico(), dao: DaoPrestadorDeServicoXTipoDeServico());

  int getQuantidadePrestadoresTipoDeServicoCidade(int codTipoDeServico, int codCidade) {
    int totalDePrestadoresDeServico = 0;
    List<DataModelPrestadorDeServicoXTipoDeServico> listPrestadoresDeServico = dao.getDataModelsByTipoDeServico(codTipoDeServico);
    listPrestadoresDeServico.forEach( (dataModel) {
       if (DaoPrestadorDeServicoXCidade().verificaSePrestadorAtendeNaCidade(dataModel.codPrestadorDeServico, codCidade)) totalDePrestadoresDeServico++;

    });
    return totalDePrestadoresDeServico;
  }

  List<DataModelPrestadorDeServicoXTipoDeServico> getDataModelsByTipoDeServico(int codTipoDeServico) {
    return dao.getDataModelsByTipoDeServico(codTipoDeServico);
  }
}
