import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home24x7/features/hubPrestador/viewModelHub.dart';
import 'package:home24x7/features/hubPrestador/views/viewHubBody.dart';
import 'package:home24x7/framework/view.dart';


import '../../businessModels/businessModelDadosPrestador.dart';
import '../../businessModels/businessModelUsuario.dart';
import '../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import 'viewActionsHub.dart';

class ViewHubPrestador
    extends View<ViewModelHubPrestador, ViewActionsHubPrestador> {
  ViewHubPrestador({
    Key? key,
    ViewModelHubPrestador? viewModel,
    required ViewActionsHubPrestador viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    //print("prestador"+ viewModel!.prestador.toString()); //

    print("prestadorDeServicos"+viewModel!.prestadorDeServicos.toString());
    print("listaAvaliacoesPrestadorDeServico"+viewModel!.listaAvaliacoesPrestadorDeServico.toString());
    print("tiposDeServico"+viewModel!.tiposDeServico.toString());
    print("cidade"+viewModel!.cidade.toString());

    if (viewModel == null) {
      return Center(
        child: CircularProgressIndicatorPersonalizado(),
      );
    } else {
      return ViewHubBodyPrestador(
          viewModel: viewModel!, viewActions: viewActions);
    }
  }
}
