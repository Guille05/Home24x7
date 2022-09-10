import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/framework/businessModel.dart';

import '../../../quickfix/lib/daos/businessModelCidade.dart';
import '../../../quickfix/lib/daos/businessModelTiposDeServico.dart';

class BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico extends BusinessModel {
  final BusinessModelCidade cidade;
  final BusinessModelTiposDeServico tipoDeServico;
  final List<BusinessModelPrestadorDeServicos> prestadoresDeServico;

  BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico({
    required this.cidade,
    required this.tipoDeServico,
    required this.prestadoresDeServico,
  }) : super(id: cidade.codCidade.toString() + '-' + tipoDeServico.codTipoServico.toString());

  factory BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico.vazio() => BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico(
        cidade: BusinessModelCidade.vazio(),
        tipoDeServico: BusinessModelTiposDeServico.vazio(),
        prestadoresDeServico: List.empty(growable: true),
      );
}
