import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home24x7/features/hubUsuario/viewModelHub.dart';
import 'package:home24x7/features/hubUsuario/views/viewHubBody.dart';
import 'package:home24x7/framework/view.dart';


import '../../businessModels/businessModelUsuario.dart';
import '../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import 'viewActionsHub.dart';

class ViewHubUsuario extends View<ViewModelHubUsuario, ViewActionsHubUsuario> {
  const ViewHubUsuario({
    Key? key,
    ViewModelHubUsuario? viewModel,
    required ViewActionsHubUsuario viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {

    if (viewModel == null) {
      return const Center(
        child: CircularProgressIndicatorPersonalizado(),
      );
    } else {
      return ViewHubBodyUsuario(
          viewModel: viewModel!, viewActions: viewActions);
    }
  }
}
