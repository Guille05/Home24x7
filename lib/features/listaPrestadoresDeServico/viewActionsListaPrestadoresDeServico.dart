import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home24x7/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:home24x7/features/infoPrestadorDeServico/presenterInfoPrestadorDeServico.dart';
import 'package:home24x7/features/listaPrestadoresDeServico/viewModelListaPrestadoresDeServico.dart';
import 'package:home24x7/framework/pipe.dart';
import 'package:home24x7/framework/viewActions.dart';

import 'blocEventListaPrestadoresDeServico.dart';

class ViewActionsListaPrestadoresDeServico extends ViewActions<BlocEventListaPrestadoresDeServico> {
  ViewActionsListaPrestadoresDeServico(Pipe<BlocEventListaPrestadoresDeServico> blocPipeIn) : super(blocPipeIn);

  void aplicaFiltroPesquisa(ViewModelListaPrestadoresDeServico viewModel) {
    BlocEventListaPrestadoresDeServicoAplicaFiltroDePesquisa blocEvent = BlocEventListaPrestadoresDeServicoAplicaFiltroDePesquisa(viewModel);
    blocPipeIn.send(blocEvent);
  }

  void refreshDadosDaTela(ViewModelListaPrestadoresDeServico viewModel) {
    BlocEventListaPrestadoresDeServicoInicializaViewModel blocEvent = BlocEventListaPrestadoresDeServicoInicializaViewModel(
      codCidade: viewModel.cidade.codCidade,
      codTipoDeServico: viewModel.tiposDeServico.codTipoServico,
    );
    blocPipeIn.send(blocEvent);
  }

  void abreTelaInfoPrestadorDeServico(
      BuildContext context, ViewModelListaPrestadoresDeServico viewModel, BusinessModelPrestadorDeServicos prestadorDeServicos) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PresenterInfoPrestadorDeServico.presenter(prestadorDeServicos, viewModel.cidade, viewModel.tiposDeServico),
      ),
    );
  }
}
