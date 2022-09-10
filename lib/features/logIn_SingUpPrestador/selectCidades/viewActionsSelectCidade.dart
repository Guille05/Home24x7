import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../framework/pipe.dart';
import '../../../framework/viewActions.dart';
import 'viewModelSelectCidade.dart';
import 'blocEventSelectCidade.dart';


class ViewActionsSelectCidade extends ViewActions<BlocEventSelectCidade> {
  ViewActionsSelectCidade(Pipe<BlocEventSelectCidade> blocPipeIn)
      : super(blocPipeIn);

  void aplicaFiltroPesquisa(ViewModelSelectCidade viewModel) {
    BlocEventSelectCidadeAplicaFiltroDePesquisa blocEvent = BlocEventSelectCidadeAplicaFiltroDePesquisa(viewModel);
    blocPipeIn.send(blocEvent);
  }


  void selectCidade(
      BuildContext context, ViewModelSelectCidade viewModel, int id) {
    BlocEventSelectCidadeAtualizaCidadesSelecionadas bolcEvent =
        BlocEventSelectCidadeAtualizaCidadesSelecionadas(
            idCidadeSelecionada: id, viewModel: viewModel);

    blocPipeIn.send(bolcEvent);
  }

  void filterListaCidades(ViewModelSelectCidade viewModel) {
    BlocEventSelectCidadeAplicaFiltroDePesquisa blocEvent = BlocEventSelectCidadeAplicaFiltroDePesquisa(viewModel);
    blocPipeIn.send(blocEvent);
  }


    void savarListaSelecionadaFirebase(ViewModelSelectCidade viewModel) {
    BlocEventSavarListaSelecionadaFirebase blocEvent = BlocEventSavarListaSelecionadaFirebase(viewModel);
    blocPipeIn.send(blocEvent);
  }
}
