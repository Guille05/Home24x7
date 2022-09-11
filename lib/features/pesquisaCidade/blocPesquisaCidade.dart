import 'package:home24x7/businessModels/businessModelCidade.dart';
import 'package:home24x7/features/pesquisaCidade/viewModelPesquisaCidade.dart';
import 'package:home24x7/framework/bloc.dart';
import 'package:home24x7/util/cidade.dart';
import '../../provider/cidade/providerCidade.dart';
import '../../provider/tiposDeServico/providerTiposDeServico.dart';
import 'blocEventPesquisaCidade.dart';
import 'featureModelPesquisaCidade.dart';

class BlocPesquisaCidade
    extends Bloc<ViewModelPesquisaCidade, BlocEventPesquisaCidade> {
  @override
  void onReceiveBlocEvent(BlocEventPesquisaCidade blocEvent) {
    if (blocEvent is BlocEventPesquisaCidadeInicializaViewModel)
      _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventPesquisaCidadeAplicaFiltroDePesquisa)
      _aplicaFiltroDePesquisa(blocEvent);
  } // abrir whataspp

  void _inicializaViewModel(
      BlocEventPesquisaCidadeInicializaViewModel blocEvent) async {
    List<FeatureModelPesquisaCidade> listaCompletaFeatureModels =
        await _buscaListaFeatureModelCidade();
    ViewModelPesquisaCidade viewModel = ViewModelPesquisaCidade(
      listaCompleta: listaCompletaFeatureModels,
    );
    this.sendViewModelOut(viewModel);
  }

// colocar os dado iniciais em uma tela

  void _aplicaFiltroDePesquisa(
      BlocEventPesquisaCidadeAplicaFiltroDePesquisa blocEvent) {
    ViewModelPesquisaCidade viewModel = blocEvent.viewModel;
    viewModel.aplicaFiltroDePesquisa();
    if (viewModel.listaVisivel.isEmpty) {
      viewModel.mensagemDeErro =
          "There are no cities matching '${viewModel.controlerFieldPesquisa.text}'";
    } else {
      viewModel.mensagemDeErro = "";
    }
    this.sendViewModelOut(viewModel);
  }

  Future<List<BusinessModelCidade>> getCidades() async {
    List<BusinessModelCidade> listaDeTodasAsCidades = [];

    listaDeTodasAsCidades = await ProviderCidade().getBusinessModels();
    return listaDeTodasAsCidades;
  }

  Future<List<FeatureModelPesquisaCidade>>
      _buscaListaFeatureModelCidade() async {
    List<BusinessModelCidade> listaBusinessModelTiposDeServico = await getCidades();


    List<FeatureModelPesquisaCidade> listaCompletaFeatureModels =
        List.empty(growable: true);
    listaBusinessModelTiposDeServico.forEach((businessModel) {
      FeatureModelPesquisaCidade featureModelPesquisaCidade =
          FeatureModelPesquisaCidade(
        cidade: businessModel,
      );
      listaCompletaFeatureModels.add(featureModelPesquisaCidade);
    });
    return listaCompletaFeatureModels;
  }
}
