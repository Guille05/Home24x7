
import '../../framework/dataModel.dart';
import '../city/dataModelCidade.dart';
import '../tiposDeServico/dataModelTipoDeServico.dart';
import '../worker/dataModelPrestadorDeServicos.dart';

class DataModelPrestadoresDeServicoPorCidadeTipoDeServico extends DataModel {
  final DataModelCidade cidade;
  final DataModelTipoDeServico tipoServico;
  final List<DataModelPrestadorDeServicos> prestadoresServico;

  DataModelPrestadoresDeServicoPorCidadeTipoDeServico({
    required this.cidade,
    required this.tipoServico,
    required this.prestadoresServico,
  }) : super(id: cidade.codCidade.toString() + '-' + tipoServico.codTipoServico.toString());
}
