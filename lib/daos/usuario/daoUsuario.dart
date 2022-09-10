
import 'package:projeto_treinamento/daos/usuario/dataModelBuilderUsuario.dart';
import 'package:projeto_treinamento/daos/usuario/dataModelUsuario.dart';
import 'package:projeto_treinamento/framework/daoWebApi.dart';


class DaoUsuario extends DaoWebApi<DataModelUsuario, DataModelBuilderUsuario> {
  DaoUsuario()
      : super(
          dataModelBuilder: DataModelBuilderUsuario(),
          server: "https://127.0.0.1/api-projeto-treinamento",
          model: "usuario",
        );
}
