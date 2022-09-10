import 'package:home24x7/features/listaPrestadoresDeServico/viewModelListaPrestadoresDeServico.dart';
import 'package:home24x7/framework/blocEvent.dart';


abstract class BlocEventListaPrestadoresDeServico extends BlocEvent {}

class BlocEventListaPrestadoresDeServicoInicializaViewModel extends BlocEventListaPrestadoresDeServico {
  final int codTipoDeServico;
  final int codCidade;

  BlocEventListaPrestadoresDeServicoInicializaViewModel({required this.codTipoDeServico, required this.codCidade});
}

class BlocEventListaPrestadoresDeServicoAplicaFiltroDePesquisa extends BlocEventListaPrestadoresDeServico {
  final ViewModelListaPrestadoresDeServico viewModel;

  BlocEventListaPrestadoresDeServicoAplicaFiltroDePesquisa(this.viewModel);
}
