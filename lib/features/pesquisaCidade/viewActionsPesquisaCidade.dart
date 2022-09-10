import 'package:home24x7/features/pesquisaCidade/viewModelPesquisaCidade.dart';
import 'package:home24x7/framework/pipe.dart';
import 'package:home24x7/framework/viewActions.dart';


import 'blocEventPesquisaCidade.dart';

class ViewActionsPesquisaCidade extends ViewActions<BlocEventPesquisaCidade> {
  ViewActionsPesquisaCidade(Pipe<BlocEventPesquisaCidade> blocPipeIn) : super(blocPipeIn);

  void aplicaFiltroPesquisa(ViewModelPesquisaCidade viewModel) {
    BlocEventPesquisaCidadeAplicaFiltroDePesquisa blocEvent = BlocEventPesquisaCidadeAplicaFiltroDePesquisa(viewModel);
    blocPipeIn.send(blocEvent);
  }
}

