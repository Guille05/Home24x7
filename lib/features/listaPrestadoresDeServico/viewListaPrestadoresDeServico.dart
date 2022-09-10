import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home24x7/features/listaPrestadoresDeServico/views/actionsListaPrestadoresDeServico.dart';
import 'package:home24x7/features/listaPrestadoresDeServico/views/bodyListaPrestadoresDeServico.dart';
import 'package:home24x7/features/listaPrestadoresDeServico/views/titleListaPrestadoresDeServico.dart';
import 'package:home24x7/framework/view.dart';

import '../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import '../../util/libraryComponents/colors/colors.dart';
import 'viewActionsListaPrestadoresDeServico.dart';
import 'viewModelListaPrestadoresDeServico.dart';

class ViewListaPrestadoresDeServico extends View<ViewModelListaPrestadoresDeServico, ViewActionsListaPrestadoresDeServico> {
  const ViewListaPrestadoresDeServico({
    Key? key,
    ViewModelListaPrestadoresDeServico? viewModel,
    required ViewActionsListaPrestadoresDeServico viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    if (viewModel == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicatorPersonalizado(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: TitleListaDePrestadoresDeServico(viewModel: this.viewModel!),
          actions: [ActionsListaPrestadoresDeServico(viewModel: this.viewModel!, viewActions: this.viewActions)],
          backgroundColor: ColorAppBar,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: BodyListaPrestadoresDeServico(
          viewModel: this.viewModel!,
          viewActions: this.viewActions,
        ),
      );
    }
  }
}
