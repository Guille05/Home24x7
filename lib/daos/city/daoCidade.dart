import 'package:home24x7/daos/city/dataModelBuilderCidade.dart';
import 'package:home24x7/framework/daoWebApi.dart';


import 'dataModelCidade.dart';

class DaoCidade extends DaoWebApi<DataModelCidade, DataModelBuilderCidade> {
  DaoCidade()
      : super(
          dataModelBuilder: DataModelBuilderCidade(),
          server: "https://voadragons.com",
          model: "city",
        );
}
