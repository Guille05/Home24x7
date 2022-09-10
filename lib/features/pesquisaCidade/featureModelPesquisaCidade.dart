import 'package:home24x7/businessModels/businessModelCidade.dart';
import 'package:home24x7/framework/mixInDescricao.dart';


class FeatureModelPesquisaCidade with MixInDescricao {
  final BusinessModelCidade cidade;

  FeatureModelPesquisaCidade({required this.cidade});

  @override
  String getDescricao() {
    return cidade.nome;
  }
}