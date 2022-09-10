import 'package:home24x7/framework/dataModel.dart';


class DataModelDDD extends DataModel {
  final int ddd;
  final String uf;

  DataModelDDD({
    required this.ddd,
    required this.uf,
  }) : super(id: ddd.toString());
}