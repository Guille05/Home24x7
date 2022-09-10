
import '../../framework/dataModelBuilder.dart';
import '../city/dataModelBuilderCidade.dart';
import '../tiposDeServico/dataModelBuilderTipoDeServico.dart';
import '../tiposDeServico/dataModelTipoDeServico.dart';
import 'dataModelPrincipaisTiposDeServicoCidade.dart';

class DataModelBuilderPrincipaisTipoDeServicoCidade extends DataModelBuilder<DataModelPrincipaisTiposDeServicoCidade> {
  @override
  DataModelPrincipaisTiposDeServicoCidade? createDataModel(Map<String, dynamic> json) {
    return DataModelPrincipaisTiposDeServicoCidade(
      cidade: DataModelBuilderCidade().createDataModel(json["cidade"])!,
      tiposDeServico: _getTiposDeServicoFromJson(json["tiposDeServico"] as List<dynamic>),
    );
  }

  List<DataModelTipoDeServico> _getTiposDeServicoFromJson(List<dynamic> json) {
    List<DataModelTipoDeServico> lista = List.empty(growable: true);
    json.forEach((element) {
      lista.add(DataModelBuilderTipoDeServico().createDataModel(element)!);
    });
    return lista;
  }

  @override
  Map<String, dynamic>? createJson(DataModelPrincipaisTiposDeServicoCidade? dataModel) {
    if (dataModel == null) return null;
    return {
      "cidade": DataModelBuilderCidade().createJson(dataModel.cidade),
      "tiposDeServico": dataModel.tiposDeServico,
    };
  }
}
