

import 'package:home24x7/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:home24x7/features/pesquisaTipoServico/viewModelPesquisaTipoServico.dart';
import 'package:home24x7/framework/blocEvent.dart';

abstract class BlocEventPesquisaTipoServico extends BlocEvent {}

class BlocEventPesquisaTipoServicoInicializaViewModel extends BlocEventPesquisaTipoServico {
  final BusinessModelPrincipaisTiposDeServicoCidade principaisTiposDeServicoCidade;

  BlocEventPesquisaTipoServicoInicializaViewModel({required this.principaisTiposDeServicoCidade});

}

class BlocEventPesquisaTipoServicoAplicaFiltroDePesquisa extends BlocEventPesquisaTipoServico {
  final ViewModelPesquisaTipoServico viewModel;

  BlocEventPesquisaTipoServicoAplicaFiltroDePesquisa(this.viewModel);
}
