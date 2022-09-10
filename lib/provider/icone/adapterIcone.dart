import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../businessModels/businessModelIcone.dart';
import '../../daos/icon/dataModelIcone.dart';
import '../../framework/adapter.dart';

class AdapterIcone extends Adapter<BusinessModelIcone, DataModelIcone> {
  @override
  Future<BusinessModelIcone> createBusinessModel(DataModelIcone? dataModel) async {
    if (dataModel == null)
      return BusinessModelIcone(
          id: "",
          icone: IconData(
            Icons.close.codePoint,
            fontFamily: Icons.close.fontFamily,
            fontPackage: Icons.close.fontPackage,
          ));
    else
      return BusinessModelIcone(
          id: dataModel.id,
          icone: IconData(
            dataModel.codePoint,
            fontFamily: dataModel.fontFamily,
            fontPackage: dataModel.fontPackage,
          ));
  }

  @override
  Future<DataModelIcone> createDataModel(BusinessModelIcone businessModel) async {
    return DataModelIcone(
      id: businessModel.id,
      codePoint: businessModel.icone.codePoint,
      fontFamily: businessModel.icone.fontFamily ?? "",
      fontPackage: businessModel.icone.fontPackage ?? "",
    );
  }
}
