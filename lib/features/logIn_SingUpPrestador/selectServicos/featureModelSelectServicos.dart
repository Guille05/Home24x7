
import '../../../businessModels/businessModelCidade.dart';
import '../../../framework/mixInDescricao.dart';

class FeatureModelSelectCidade with MixInDescricao {
  final BusinessModelCidade cidade;

  FeatureModelSelectCidade({required this.cidade});

  @override
  String getDescricao() {
    return cidade.nome;
  }
}
