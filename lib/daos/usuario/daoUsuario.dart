import 'package:home24x7/daos/usuario/dataModelBuilderUsuario.dart';
import 'package:home24x7/daos/usuario/dataModelUsuario.dart';
import 'package:home24x7/framework/daoWebApi.dart';


class DaoUsuario extends DaoWebApi<DataModelUsuario, DataModelBuilderUsuario> {
  DaoUsuario()
      : super(
          dataModelBuilder: DataModelBuilderUsuario(),
          server: "https://127.0.0.1/api-projeto-treinamento",
          model: "usuario",
        );
}
