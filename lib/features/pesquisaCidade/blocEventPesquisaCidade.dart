import 'package:home24x7/features/pesquisaCidade/viewModelPesquisaCidade.dart';
import 'package:home24x7/framework/blocEvent.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/viewModelPesquisaCidade.dart';
import 'package:projeto_treinamento/framework/blocEvent.dart';

abstract class BlocEventPesquisaCidade extends BlocEvent {}

class BlocEventPesquisaCidadeInicializaViewModel extends BlocEventPesquisaCidade {}

class BlocEventPesquisaCidadeAplicaFiltroDePesquisa extends BlocEventPesquisaCidade {
  final ViewModelPesquisaCidade viewModel;

  BlocEventPesquisaCidadeAplicaFiltroDePesquisa(this.viewModel);
}


