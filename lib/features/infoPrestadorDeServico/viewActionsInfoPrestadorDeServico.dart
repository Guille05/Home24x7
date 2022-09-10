
import 'package:home24x7/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';
import 'package:home24x7/framework/pipe.dart';
import 'package:home24x7/framework/viewActions.dart';

import 'blocEventInfoPrestadorDeServico.dart';

class ViewActionsInfoPrestadorDeServico
    extends ViewActions<BlocEventInfoPrestadorDeServico> {
  ViewActionsInfoPrestadorDeServico(
      Pipe<BlocEventInfoPrestadorDeServico> blocPipeIn)
      : super(blocPipeIn);

  Future<void> AtualizaTelaPrestadorDeServico(
      ViewModelInfoPrestadorDeServico viewModel) async {
    BlocEventInfoPrestadorDeServicoInicializaViewModel blocEvent =
        BlocEventInfoPrestadorDeServicoInicializaViewModel(
      viewModel.prestadorDeServicos,
      viewModel.cidade,
      viewModel.tiposDeServico,
    );
    blocPipeIn.send(blocEvent);
  }
}
