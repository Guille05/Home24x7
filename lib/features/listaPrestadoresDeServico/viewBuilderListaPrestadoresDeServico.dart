import 'package:home24x7/framework/viewBuilder.dart';

import 'viewActionsListaPrestadoresDeServico.dart';
import 'viewListaPrestadoresDeServico.dart';
import 'viewModelListaPrestadoresDeServico.dart';

class ViewBuilderListaPrestadoresDeServico extends ViewBuilder<ViewListaPrestadoresDeServico, ViewModelListaPrestadoresDeServico, ViewActionsListaPrestadoresDeServico> {
  @override
  ViewListaPrestadoresDeServico createView(ViewModelListaPrestadoresDeServico? viewModel, ViewActionsListaPrestadoresDeServico viewActions) {
    return ViewListaPrestadoresDeServico(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}
