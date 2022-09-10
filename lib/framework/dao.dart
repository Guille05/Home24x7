import '../util/resposta_processamento.dart';

abstract class Dao<DM extends DataModel> {
  Future<DM?> getDataModel(String id);

  Future<List<DM>> getDataModels();

  Future<RespostaProcessamento> saveDataModel(DM dataModel);

  Future<RespostaProcessamento> removeDataModel(DM dataModel);
}
