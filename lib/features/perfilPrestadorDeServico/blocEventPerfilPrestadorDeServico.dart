import 'package:home24x7/features/perfilPrestadorDeServico/viewModelPerfilPrestadorDeServico.dart';
import 'package:home24x7/framework/blocEvent.dart';


abstract class BlocEventPerfilPrestadorDeServico extends BlocEvent {}

class BlocEventPerfilPrestadorDeServicoInicializaViewModel
    extends BlocEventPerfilPrestadorDeServico {
  final ViewModelPerfilPrestadorDeServico viewModel;

  BlocEventPerfilPrestadorDeServicoInicializaViewModel(
      {required this.viewModel});
}

class BlocEventPerfilPrestadorDeServicoAtualizaViewModel
    extends BlocEventPerfilPrestadorDeServico {
  final ViewModelPerfilPrestadorDeServico viewModel;

  BlocEventPerfilPrestadorDeServicoAtualizaViewModel({required this.viewModel});
}
