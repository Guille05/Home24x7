import 'package:home24x7/framework/viewBuilder.dart';


import 'viewActionsHub.dart';
import 'viewHub.dart';
import 'viewModelHub.dart';

class ViewBuilderHubPrestador extends ViewBuilder<ViewHubPrestador, ViewModelHubPrestador, ViewActionsHubPrestador> {
  @override
  ViewHubPrestador createView(ViewModelHubPrestador? viewModel, ViewActionsHubPrestador viewActions) {
    return ViewHubPrestador(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}

// toda view precisa de model e actions