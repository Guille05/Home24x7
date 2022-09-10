import '../../framework/dataModelBuilder.dart';
import 'dataModelTipoDeServico.dart';

class DataModelBuilderTipoDeServico
    extends DataModelBuilder<DataModelTipoDeServico> {
  @override
  DataModelTipoDeServico? createDataModel(Map<String, dynamic> json) {
    return DataModelTipoDeServico(
      codTipoServico: json["codTipoServico"],
      descricao: json["description"],
    );
  }

  @override
  Map<String, dynamic>? createJson(DataModelTipoDeServico? dataModel) {
    if (dataModel == null) return null;
    return {
      "codTipoServico": dataModel.codTipoServico,
      "description": dataModel.descricao,
    };
  }
}
