import '../../framework/dao.dart';
import '../../util/resposta_processamento.dart';
import 'dataModelBuilderDadosPrestador.dart';
import 'dataModelDadosPrestador.dart';
import 'firebaseInterfaceDadosPrestador.dart';

class DaoDadosPrestador extends Dao<DataModelDadosPrestador> {
  FirebaseinterfaceDadosPrestador firebaseInterface =
      FirebaseinterfaceDadosPrestador(
    tableName: 'dataWorker',
    dataModelBuilder: DataModelBuilderDadosPrestador(),
  );

  Future<DataModelDadosPrestador?> getDataModel(String id) async {
    DataModelDadosPrestador? dataModelDadosPrestador;
    dataModelDadosPrestador = await firebaseInterface.getDataModelFromFirebase();
    return dataModelDadosPrestador;
  }

  Future<List<DataModelDadosPrestador>> getDataModels() async {
    List<DataModelDadosPrestador> listaDataModelDadosPrestador = [];
    listaDataModelDadosPrestador = await firebaseInterface
        .getDataModelsFromFirebase(DataModelBuilderDadosPrestador());

    return listaDataModelDadosPrestador;
  }

  Future<RespostaProcessamento> saveDataModel(
      DataModelDadosPrestador dataModel) async {
    return RespostaProcessamento.ok();
  }

  Future<RespostaProcessamento> removeDataModel(
      DataModelDadosPrestador dataModel) async {
    return RespostaProcessamento.ok();
  }
}
