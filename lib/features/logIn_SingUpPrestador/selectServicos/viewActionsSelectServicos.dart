import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../framework/pipe.dart';
import '../../../framework/viewActions.dart';
import 'viewModelSelectServicos.dart';
import 'blocEventSelectServicos.dart';


class ViewActionsSelectServicos extends ViewActions<BlocEventSelectServicos> {
  ViewActionsSelectServicos(Pipe<BlocEventSelectServicos> blocPipeIn)
      : super(blocPipeIn);

  void aplicaFiltroPesquisa(ViewModelSelectServicos viewModel) {
    BlocEventSelectServicosAplicaFiltroDePesquisa blocEvent = BlocEventSelectServicosAplicaFiltroDePesquisa(viewModel);
    blocPipeIn.send(blocEvent);
  }


  void selectServicos(
      BuildContext context, ViewModelSelectServicos viewModel, int id) {
    BlocEventSelectServicosAtualizaServicosSelecionados bolcEvent =
        BlocEventSelectServicosAtualizaServicosSelecionados(
            idCidadeSelecionada: id, viewModel: viewModel);

    blocPipeIn.send(bolcEvent);
  }

  void filterListaCidades(ViewModelSelectServicos viewModel) {
    BlocEventSelectServicosAplicaFiltroDePesquisa blocEvent = BlocEventSelectServicosAplicaFiltroDePesquisa(viewModel);
    blocPipeIn.send(blocEvent);
  }

    void savarListaSelecionadaFirebase(ViewModelSelectServicos viewModel) {
    BlocEventSavarListaSelecionadaFirebase blocEvent = BlocEventSavarListaSelecionadaFirebase(viewModel);
    blocPipeIn.send(blocEvent);
  }
}
