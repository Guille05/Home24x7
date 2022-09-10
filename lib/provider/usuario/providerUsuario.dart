
import '../../businessModels/businessModelUsuario.dart';
import '../../daos/usuario/daoUsuario.dart';
import '../../daos/usuario/dataModelUsuario.dart';
import '../../framework/providerDireto.dart';
import 'adapterUsuario.dart';

class ProviderUsuario extends ProviderDireto<DataModelUsuario, BusinessModelUsuario, DaoUsuario, AdapterUsuario> {
  ProviderUsuario()
      : super(
          dao: DaoUsuario(),
          adapter: AdapterUsuario(),
        );
}
