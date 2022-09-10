import 'package:projeto_treinamento/daos/city/dataModelBuilderCidade.dart';
import 'package:projeto_treinamento/framework/daoWebApi.dart';

import 'dataModelCidade.dart';

class DaoCidade extends DaoWebApi<DataModelCidade, DataModelBuilderCidade> {
  DaoCidade()
      : super(
          dataModelBuilder: DataModelBuilderCidade(),
          server: "https://voadragons.com",
          model: "city",
        );
}
