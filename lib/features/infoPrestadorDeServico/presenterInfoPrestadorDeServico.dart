import 'package:home24x7/businessModels/businessModelCidade.dart';
import 'package:home24x7/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:home24x7/businessModels/businessModelTiposDeServico.dart';
import 'package:home24x7/framework/presenter.dart';


import 'blocEventInfoPrestadorDeServico.dart';
import 'blocInfoPrestadorDeServico.dart';
import 'viewActionsInfoPrestadorDeServico.dart';
import 'viewBuilderInfoPrestadorDeServico.dart';
import 'viewInfoPrestadorDeServico.dart';
import 'viewModelInfoPrestadorDeServico.dart';

class PresenterInfoPrestadorDeServico extends Presenter<ViewInfoPrestadorDeServico, ViewModelInfoPrestadorDeServico, ViewActionsInfoPrestadorDeServico,
    BlocEventInfoPrestadorDeServico, BlocInfoPrestadorDeServico, ViewBuilderInfoPrestadorDeServico> {
  PresenterInfoPrestadorDeServico({
    required BlocInfoPrestadorDeServico bloc,
    required ViewBuilderInfoPrestadorDeServico viewBuilder,
    required ViewActionsInfoPrestadorDeServico viewActions,
    required BusinessModelPrestadorDeServicos prestadorDeServicos,
    required BusinessModelCidade cidade,
    required BusinessModelTiposDeServico tipoServico,
  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel(prestadorDeServicos, cidade, tipoServico);
  }

  factory PresenterInfoPrestadorDeServico.presenter(
      BusinessModelPrestadorDeServicos prestadorDeServicos, BusinessModelCidade cidade, BusinessModelTiposDeServico tipoServico) {
    BlocInfoPrestadorDeServico bloc = BlocInfoPrestadorDeServico();
    ViewBuilderInfoPrestadorDeServico viewBuilder = ViewBuilderInfoPrestadorDeServico();
    ViewActionsInfoPrestadorDeServico viewActions = ViewActionsInfoPrestadorDeServico(bloc.pipeIn);
    return PresenterInfoPrestadorDeServico(
      bloc: bloc,
      viewBuilder: viewBuilder,
      viewActions: viewActions,
      prestadorDeServicos: prestadorDeServicos,
      cidade: cidade,
      tipoServico: tipoServico,
    );
  }

  void _enviaEventoInicializacaoViewModel(
      BusinessModelPrestadorDeServicos prestadorDeServicos, BusinessModelCidade cidade, BusinessModelTiposDeServico tipoServico) {
    BlocEventInfoPrestadorDeServicoInicializaViewModel blocEvent = BlocEventInfoPrestadorDeServicoInicializaViewModel(prestadorDeServicos, cidade, tipoServico);
    this.bloc.pipeIn.send(blocEvent);
  }
}
