import 'package:home24x7/businessModels/businessModelCidade.dart';
import 'package:home24x7/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:home24x7/businessModels/businessModelTiposDeServico.dart';
import 'package:home24x7/framework/blocEvent.dart';

import '../../businessModels/businessModelPrestadorDeServicos.dart';


abstract class BlocEventInfoPrestadorDeServico extends BlocEvent {}

class BlocEventInfoPrestadorDeServicoInicializaViewModel extends BlocEventInfoPrestadorDeServico {
  final BusinessModelPrestadorDeServicos prestadorDeServicos;
  final BusinessModelCidade cidade;
  final BusinessModelTiposDeServico tipoServico;

  BlocEventInfoPrestadorDeServicoInicializaViewModel(this.prestadorDeServicos, this.cidade, this.tipoServico);
}
