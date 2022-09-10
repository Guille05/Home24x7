
import '../../framework/dataModel.dart';
import '../city/dataModelCidade.dart';
import '../tiposDeServico/dataModelTipoDeServico.dart';

class DataModelPrincipaisTiposDeServicoCidade extends DataModel {
  final DataModelCidade cidade;
  final List<DataModelTipoDeServico> tiposDeServico;

  DataModelPrincipaisTiposDeServicoCidade({
    required this.cidade,
    required this.tiposDeServico,
  }) : super(id: cidade.codCidade.toString());
}
