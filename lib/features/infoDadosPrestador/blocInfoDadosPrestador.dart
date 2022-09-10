
import 'package:home24x7/businessModels/businessModelCidade.dart';
import 'package:home24x7/businessModels/businessModelDadosPrestador.dart';
import 'package:home24x7/framework/bloc.dart';
import 'package:home24x7/provider/cidade/providerCidade.dart';
import 'package:home24x7/provider/dadosPrestador/providerDadosPrestador.dart';

import 'blocEventInfoDadosPrestador.dart';
import 'viewModelInfoDadosPrestador.dart';

class BlocInfoDadosPrestador
    extends Bloc<ViewModelInfoDadosPrestador, BlocEventInfoDadosPrestador> {
  @override
  void onReceiveBlocEvent(BlocEventInfoDadosPrestador blocEvent) {
    if (blocEvent is BlocEventInfoDadosPrestadorInicializaViewModel)
      _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventInfoDadosPrestadorAtualizaViewModel)
      _atualizaViewModel(blocEvent);
  }

  void _inicializaViewModel(
      BlocEventInfoDadosPrestadorInicializaViewModel blocEvent) async {
    List<BusinessModelCidade> cidades =
        await ProviderCidade().getBusinessModels();

    ViewModelInfoDadosPrestador viewModel = ViewModelInfoDadosPrestador(
      prestador: blocEvent.viewModel.prestador,
      imagemAtualizada: blocEvent.viewModel.imagemAtualizada,
      cidades: blocEvent.viewModel.cidades,
      listaCompletaCidade: cidades,
    );

    this.sendViewModelOut(viewModel);
  }

  void _atualizaViewModel(
      BlocEventInfoDadosPrestadorAtualizaViewModel blocEvent) {
    ViewModelInfoDadosPrestador viewModel = ViewModelInfoDadosPrestador(
      cidades: blocEvent.viewModel.cidades,
      prestador: blocEvent.viewModel.prestador,
      listaCompletaCidade: blocEvent.viewModel.listaCompletaCidade,
      imagemAtualizada: blocEvent.viewModel.imagemAtualizada,
    );
    this.sendViewModelOut(viewModel);
    BusinessModelDadosPrestador businessModel = BusinessModelDadosPrestador(
      city: viewModel.prestador.city,
      IdPrestador: viewModel.prestador.IdPrestador,
      dataAberturaConta: viewModel.prestador.dataAberturaConta,
      dataVencimentoPlano: viewModel.prestador.dataVencimentoPlano,
      name: viewModel.prestador.name,
      numeroDeCliquesNoLigarOuWhatsApp:
          viewModel.prestador.numeroDeCliquesNoLigarOuWhatsApp,
      phone: viewModel.prestador.phone,
      profilePicture: viewModel.prestador.profilePicture,
      workingHours: viewModel.prestador.workingHours,
      description: viewModel.prestador.description,
      roles: viewModel.prestador.roles,
      tipoPlanoPrestador: viewModel.prestador.tipoPlanoPrestador,
    );
    ProvideDadosPrestador().saveBusinessModel(businessModel);
  }
}
