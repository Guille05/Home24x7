import 'package:home24x7/features/hubPrestador/viewModelHub.dart';
import 'package:home24x7/framework/blocEvent.dart';


abstract class BlocEventHubPrestador extends BlocEvent {}

class BlocEventHubInicializaViewModelPrestador extends BlocEventHubPrestador {
  final ViewModelHubPrestador? viewModel;
  BlocEventHubInicializaViewModelPrestador({required this.viewModel});

}

class BlocEventHubSelecionaCidade extends BlocEventHubPrestador {
  final int codCidade;
  final ViewModelHubPrestador viewModel;

  BlocEventHubSelecionaCidade({required this.codCidade, required this.viewModel});
}

class BlocEventHubPrestadorAtualizaViewModel extends BlocEventHubPrestador {
  final ViewModelHubPrestador viewModel;

  BlocEventHubPrestadorAtualizaViewModel({required this.viewModel});
}
