
import '../framework/businessModel.dart';
import 'businessModelCidade.dart';
import 'businessModelPrestadorDeServicos.dart';
import 'businessModelTiposDeServico.dart';

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
