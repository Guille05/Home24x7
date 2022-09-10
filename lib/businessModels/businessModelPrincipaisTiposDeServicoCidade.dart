import 'package:projeto_treinamento/framework/businessModel.dart';

import '../../../quickfix/lib/daos/businessModelCidade.dart';
import '../../../quickfix/lib/daos/businessModelTiposDeServico.dart';

class BusinessModelPrincipaisTiposDeServicoCidade extends BusinessModel {
  final BusinessModelCidade cidade;
  final List<BusinessModelTiposDeServico> tiposDeServico;

  BusinessModelPrincipaisTiposDeServicoCidade({
    required this.cidade,
    required this.tiposDeServico,
  }) : super(id: cidade.codCidade.toString());

  factory BusinessModelPrincipaisTiposDeServicoCidade.vazio() => BusinessModelPrincipaisTiposDeServicoCidade(cidade: BusinessModelCidade.vazio(), tiposDeServico: List.empty(growable: true));
}
