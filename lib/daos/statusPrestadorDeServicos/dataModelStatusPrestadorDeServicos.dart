import '../../framework/dataModel.dart';

class DataModelStatusPrestadorDeServicos extends DataModel {
  final String telefone;
  final bool onLine;

  DataModelStatusPrestadorDeServicos({
    required this.telefone,
    required this.onLine,
  }) : super(id: telefone);
}
