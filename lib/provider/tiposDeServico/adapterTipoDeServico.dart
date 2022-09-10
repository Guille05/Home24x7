import 'package:flutter/material.dart';

import '../../businessModels/businessModelTiposDeServico.dart';
import '../../daos/tiposDeServico/dataModelTipoDeServico.dart';
import '../../framework/adapter.dart';

class AdapterTipoDeServico
    extends Adapter<BusinessModelTiposDeServico, DataModelTipoDeServico> {
  @override
  Future<BusinessModelTiposDeServico> createBusinessModel(
      DataModelTipoDeServico? dataModel) async {
    if (dataModel == null)
      return BusinessModelTiposDeServico.vazio();
    else {
      //BusinessModelIcone businessModelIcone = await AdapterIcone().createBusinessModel(dataModel.icone);
      return BusinessModelTiposDeServico(
        codTipoServico: dataModel.codTipoServico,
        descricao: dataModel.descricao,
        icone: Icons.add,
        qtdePrestadoresDeServico: 0,
      );
    }
  }

  @override
  Future<DataModelTipoDeServico> createDataModel(
      BusinessModelTiposDeServico businessModel) async {
    return DataModelTipoDeServico(
      codTipoServico: businessModel.codTipoServico,
      descricao: businessModel.descricao,
    );
  }
}
