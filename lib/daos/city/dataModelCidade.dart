import 'package:home24x7/framework/dataModel.dart';


class DataModelCidade extends DataModel {
  final int codCidade;
  final String nome;
  final int totalPrestadoresServico;

  DataModelCidade({
    required this.codCidade,
    required this.nome,
    required this.totalPrestadoresServico,
  }) : super(id: codCidade.toString());
}

/*
cara que os dados vem do banco de dados
 */