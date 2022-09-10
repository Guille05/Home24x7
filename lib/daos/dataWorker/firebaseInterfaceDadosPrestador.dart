
import '../../util/firebase/firebaseInterface.dart';
import 'dataModelBuilderDadosPrestador.dart';
import 'dataModelDadosPrestador.dart';

class FirebaseinterfaceDadosPrestador extends FirebaseInterface<DataModelDadosPrestador, DataModelBuilderDadosPrestador>{

  FirebaseinterfaceDadosPrestador({
    required String tableName,
    required DataModelBuilderDadosPrestador dataModelBuilder}) : super(tableName: tableName, dataModelBuilder: dataModelBuilder);

}