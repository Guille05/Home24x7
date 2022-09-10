
import '../../util/firebase/firebaseInterface.dart';
import 'dataModelBuilderTipoDeServico.dart';
import 'dataModelTipoDeServico.dart';

class FirebaseinterfaceTiposDeServico extends FirebaseInterface<
    DataModelTipoDeServico, DataModelBuilderTipoDeServico> {
  FirebaseinterfaceTiposDeServico(
      {required String tableName,
      required DataModelBuilderTipoDeServico dataModelBuilder})
      : super(tableName: tableName, dataModelBuilder: dataModelBuilder);
}
