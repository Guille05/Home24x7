

import 'package:home24x7/businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import 'package:home24x7/businessModels/businessModelCidade.dart';
import 'package:home24x7/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:home24x7/businessModels/businessModelTiposDeServico.dart';
import 'package:home24x7/framework/viewModel.dart';

class ViewModelInfoPrestadorDeServico extends ViewModel {
  ViewModelInfoPrestadorDeServico({
    required this.prestadorDeServicos,
    required this.listaAvaliacoesPrestadorDeServico,
    required this.cidade,
    required this.tiposDeServico,
  }) : super();

  final BusinessModelPrestadorDeServicos prestadorDeServicos;
  final List<BusinessModelAvaliacaoPrestadorDeServico> listaAvaliacoesPrestadorDeServico;
  final BusinessModelCidade cidade;
  final BusinessModelTiposDeServico tiposDeServico;
}
