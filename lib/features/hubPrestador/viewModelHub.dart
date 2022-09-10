import 'package:home24x7/businessModels/businessModelDadosPrestador.dart';
import 'package:home24x7/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:home24x7/businessModels/businessModelTiposDeServico.dart';
import '../../businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import '../../businessModels/businessModelCidade.dart';
import '../../framework/viewModel.dart';

class ViewModelHubPrestador extends ViewModel {
  final BusinessModelDadosPrestador prestador;
  final List<BusinessModelCidade> cidade;

  final List<BusinessModelAvaliacaoPrestadorDeServico>
      listaAvaliacoesPrestadorDeServico;
  final BusinessModelPrestadorDeServicos prestadorDeServicos;
  final List<BusinessModelTiposDeServico> tiposDeServico;

  ViewModelHubPrestador({
    required this.prestador,
    required this.cidade,
    required this.listaAvaliacoesPrestadorDeServico,
    required this.prestadorDeServicos,
    required this.tiposDeServico,
  }) : super();
}
