import 'package:home24x7/features/infoDadosPrestador/viewModelInfoDadosPrestador.dart';
import 'package:home24x7/framework/blocEvent.dart';


abstract class BlocEventInfoDadosPrestador extends BlocEvent {}

class BlocEventInfoDadosPrestadorInicializaViewModel extends BlocEventInfoDadosPrestador {
  final ViewModelInfoDadosPrestador viewModel;

  BlocEventInfoDadosPrestadorInicializaViewModel({required this.viewModel});
}

class BlocEventInfoDadosPrestadorAtualizaViewModel extends BlocEventInfoDadosPrestador {
  final ViewModelInfoDadosPrestador viewModel;

  BlocEventInfoDadosPrestadorAtualizaViewModel({required this.viewModel});
}
