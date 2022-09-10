
import '../../framework/dataModel.dart';

class DataModelTipoDeServico extends DataModel {
  final int codTipoServico;
  final String descricao;

  DataModelTipoDeServico({
    required this.codTipoServico,
    required this.descricao,
  }) : super(id: codTipoServico.toString());
}
