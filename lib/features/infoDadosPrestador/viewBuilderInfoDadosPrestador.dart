import 'package:home24x7/features/infoDadosPrestador/viewActionsInfoDadosPrestador.dart';
import 'package:home24x7/framework/viewBuilder.dart';
import 'viewInfoDadosPrestador.dart';
import 'viewModelInfoDadosPrestador.dart';

class ViewBuilderInfoDadosPrestador extends ViewBuilder<ViewInfoDadosPrestador, ViewModelInfoDadosPrestador, ViewActionsInfoDadosPrestador> {
  @override
  ViewInfoDadosPrestador createView(ViewModelInfoDadosPrestador? viewModel, ViewActionsInfoDadosPrestador viewActions) {
    return ViewInfoDadosPrestador(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}
