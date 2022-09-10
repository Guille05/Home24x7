
import '../util/resposta_processamento.dart';
import 'businessModel.dart';

abstract class Provider<BM extends BusinessModel> {
  Future<BM> getBusinessModel(String id);

  Future<List<BM>> getBusinessModels();

  Future<RespostaProcessamento> saveBusinessModel(BM businessModel);

  Future<RespostaProcessamento> removeBusinessModel(BM businessModel);
}
