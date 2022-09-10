import 'package:home24x7/framework/viewBuilder.dart';

import 'viewActionsPesquisaTipoServico.dart';
import 'viewModelPesquisaTipoServico.dart';
import 'viewPesquisaTipoServico.dart';

class ViewBuilderPesquisaTipoServico extends ViewBuilder<ViewPesquisaTipoServico, ViewModelPesquisaTipoServico, ViewActionsPesquisaTipoServico> {
  @override
  ViewPesquisaTipoServico createView(ViewModelPesquisaTipoServico? viewModel, ViewActionsPesquisaTipoServico viewActions) {
    return ViewPesquisaTipoServico(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}
