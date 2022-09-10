import 'package:home24x7/features/hubUsuario/viewModelHub.dart';
import 'package:home24x7/features/hubUsuario/viewModelHub.dart';
import 'package:home24x7/framework/blocEvent.dart';


abstract class BlocEventHubUsuario extends BlocEvent {}

class BlocEventHubInicializaViewModelUsuario extends BlocEventHubUsuario {
  final ViewModelHubUsuario? viewModel;
  BlocEventHubInicializaViewModelUsuario({required this.viewModel});
}

class BlocEventHubSelecionaCidade extends BlocEventHubUsuario {
  final int codCidade;
  final ViewModelHubUsuario viewModel;

  BlocEventHubSelecionaCidade(
      {required this.codCidade, required this.viewModel});
}

class BlocEventHubUsuarioAtualizaViewModel extends BlocEventHubUsuario {
  final ViewModelHubUsuario viewModel;

  BlocEventHubUsuarioAtualizaViewModel({required this.viewModel});
}
