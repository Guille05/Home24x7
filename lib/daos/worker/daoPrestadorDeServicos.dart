import 'package:home24x7/daos/worker/dataModelBuilderPrestadorDeServicos.dart';
import 'package:home24x7/framework/daoWebApi.dart';

import 'dataModelPrestadorDeServicos.dart';

class DaoPrestadorDeServicos extends DaoWebApi<DataModelPrestadorDeServicos, DataModelBuilderPrestadorDeServicos> {
  DaoPrestadorDeServicos()
      : super(
          dataModelBuilder: DataModelBuilderPrestadorDeServicos(),
          server: "htts.com",
          model: "prestadorservico",
        );
}
