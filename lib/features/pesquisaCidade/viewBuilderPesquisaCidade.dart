
import 'package:home24x7/framework/viewBuilder.dart';


import 'viewActionsPesquisaCidade.dart';
import 'viewModelPesquisaCidade.dart';
import 'viewPesquisaCidade.dart';

class ViewBuilderPesquisaCidade extends ViewBuilder<ViewPesquisaCidade, ViewModelPesquisaCidade, ViewActionsPesquisaCidade> {
  @override
  ViewPesquisaCidade createView(ViewModelPesquisaCidade? viewModel, ViewActionsPesquisaCidade viewActions) {
    return ViewPesquisaCidade(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}

// toda view precisa de model e actions