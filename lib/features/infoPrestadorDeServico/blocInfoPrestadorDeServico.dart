

import 'package:home24x7/businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import 'package:home24x7/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:home24x7/provider/prestadoresDeServicoPorCidadeTipoDeServico/providerPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:home24x7/util/getAvaliacoesPrestador.dart';
import 'package:home24x7/util/getCodigoCidade.dart';
import 'package:home24x7/util/prestador.dart';

import '../../businessModels/businessModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'blocEventInfoPrestadorDeServico.dart';
import 'viewModelInfoPrestadorDeServico.dart';

class BlocInfoPrestadorDeServico extends Bloc<ViewModelInfoPrestadorDeServico,
    BlocEventInfoPrestadorDeServico> {
  @override
  void onReceiveBlocEvent(BlocEventInfoPrestadorDeServico blocEvent) {
    if (blocEvent is BlocEventInfoPrestadorDeServicoInicializaViewModel)
      _inicializaViewModel(blocEvent);
  }

  void _inicializaViewModel(
      BlocEventInfoPrestadorDeServicoInicializaViewModel blocEvent) async {
    ViewModelInfoPrestadorDeServico viewModel;
    await Prestador().getPrestadores();
    int newcodCidade =
        await GetCodCidade(nomeCidade: blocEvent.cidade.nome).action();
    BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico businessModel =
        await ProviderPrestadoresDeServicoPorCidadeTipoDeServico() //business model null
            .getBusinessModel(newcodCidade.toString() +
                "-" +
                blocEvent.tipoServico.codTipoServico.toString());
    BusinessModelPrestadorDeServicos prestador_;

    prestador_ = businessModel.prestadoresDeServico
        .where((element) =>
            element.codPrestadorServico ==
            blocEvent.prestadorDeServicos.codPrestadorServico)
        .first;

    BusinessModelPrestadorDeServicos prestadorDeServicos =
        blocEvent.prestadorDeServicos;

    prestadorDeServicos = BusinessModelPrestadorDeServicos(
        cidades: prestador_.cidades,
        codPrestadorServico: prestador_.codPrestadorServico,
        description: prestador_.description,
        nome: prestador_.nome,
        nota: prestador_.nota,
        servicos: prestador_.servicos,
        statusOnline: prestador_.statusOnline,
        telefone: prestador_.telefone,
        tipoPlanoPrestador: prestador_.tipoPlanoPrestador,
        totalDeAvaliacoes: prestador_.totalDeAvaliacoes,
        totalDeAvaliacoesNota1: prestador_.totalDeAvaliacoesNota1,
        totalDeAvaliacoesNota2: prestador_.totalDeAvaliacoesNota2,
        totalDeAvaliacoesNota3: prestador_.totalDeAvaliacoesNota3,
        totalDeAvaliacoesNota4: prestador_.totalDeAvaliacoesNota4,
        totalDeAvaliacoesNota5: prestador_.totalDeAvaliacoesNota5,
        urlFoto: prestador_.urlFoto,
        workingHours: prestador_.workingHours);
    viewModel = ViewModelInfoPrestadorDeServico(
      prestadorDeServicos: prestadorDeServicos,
      listaAvaliacoesPrestadorDeServico: List.empty(growable: true),
      cidade: blocEvent.cidade,
      tiposDeServico: blocEvent.tipoServico,
    );
    this.sendViewModelOut(viewModel);

    List<BusinessModelAvaliacaoPrestadorDeServico>
        listaAvaliacoesPrestadorDeServico;
    if (prestadorDeServicos.totalDeAvaliacoes > 0) {
      print(await ProviderPrestadoresDeServicoPorCidadeTipoDeServico()
          .getComentarios()
          .toString());

      listaAvaliacoesPrestadorDeServico = (await GetAvaliacoesPrestador()
              .action(prestadorDeServicos.codPrestadorServico))
          .cast<BusinessModelAvaliacaoPrestadorDeServico>();
    } else {
      listaAvaliacoesPrestadorDeServico = List.empty();
    }

    print(listaAvaliacoesPrestadorDeServico);
    viewModel = ViewModelInfoPrestadorDeServico(
      prestadorDeServicos: prestadorDeServicos,
      listaAvaliacoesPrestadorDeServico: listaAvaliacoesPrestadorDeServico,
      cidade: blocEvent.cidade,
      tiposDeServico: blocEvent.tipoServico,
    );
    this.sendViewModelOut(viewModel);
  }
}
