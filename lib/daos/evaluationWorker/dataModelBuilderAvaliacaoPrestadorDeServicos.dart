import '../../framework/dataModelBuilder.dart';
import '../../util/dateTimeUtils.dart';
import 'dataModelAvaliacaoPrestadorDeServico.dart';

class DataModelBuilderAvaliacaoPrestadorDeServicos extends DataModelBuilder<DataModelAvaliacaoPrestadorDeServico> {
  @override
  DataModelAvaliacaoPrestadorDeServico? createDataModel(Map<String, dynamic> json) {
    return DataModelAvaliacaoPrestadorDeServico(
      idUsuario: json["userid"],
      codPrestadorDeServico: json["workerId"],
      nota: json["rating"].toDouble(),
      comentario: json["commentText"],
      data: formataDataDDMMYYYY(DateTime.parse(json["date"])),
      emailUsuario: json["commentText"],
    );
  }

  @override
  Map<String, dynamic>? createJson(DataModelAvaliacaoPrestadorDeServico? dataModel) {
    return null;
    /*
    if (dataModel == null) return null;
    return {
      "codPrestadorServico": dataModel.codPrestadorServico,
      "nome": dataModel.nome,
      "telefone": dataModel.telefone,
      "urlFoto": dataModel.urlFoto,
      "nota": dataModel.nota,
      "totalDeAvaliacoes": dataModel.totalDeAvaliacoes,
    };
     */
  }
}
