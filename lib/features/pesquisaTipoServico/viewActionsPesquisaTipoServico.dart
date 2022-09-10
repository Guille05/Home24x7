

import 'package:home24x7/features/pesquisaTipoServico/viewModelPesquisaTipoServico.dart';
import 'package:home24x7/framework/pipe.dart';
import 'package:home24x7/framework/viewActions.dart';

import 'blocEventPesquisaTipoServico.dart';

class ViewActionsPesquisaTipoServico extends ViewActions<BlocEventPesquisaTipoServico> {
  ViewActionsPesquisaTipoServico(Pipe<BlocEventPesquisaTipoServico> blocPipeIn) : super(blocPipeIn);

  void aplicaFiltroPesquisa(ViewModelPesquisaTipoServico viewModel) {
    BlocEventPesquisaTipoServicoAplicaFiltroDePesquisa blocEvent = BlocEventPesquisaTipoServicoAplicaFiltroDePesquisa(viewModel);
    blocPipeIn.send(blocEvent);
  }
}
