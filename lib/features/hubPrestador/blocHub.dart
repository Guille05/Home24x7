import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:home24x7/businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import 'package:home24x7/businessModels/businessModelCidade.dart';
import 'package:home24x7/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:home24x7/businessModels/businessModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:home24x7/businessModels/businessModelTiposDeServico.dart';
import 'package:home24x7/framework/bloc.dart';
import 'package:home24x7/provider/prestadoresDeServicoPorCidadeTipoDeServico/providerPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:home24x7/util/getAvaliacoesPrestador.dart';
import 'package:home24x7/util/getCodigoCidade.dart';

import '../../businessModels/businessModelDadosPrestador.dart';
import '../../provider/cidade/providerCidade.dart';
import '../../provider/dadosPrestador/providerDadosPrestador.dart';
import '../../provider/tiposDeServico/providerTiposDeServico.dart';
import 'blocEventHub.dart';
import 'viewModelHub.dart';

class BlocHub extends Bloc<ViewModelHubPrestador, BlocEventHubPrestador> {
  @override
  void onReceiveBlocEvent(BlocEventHubPrestador blocEvent) {
    if (blocEvent is BlocEventHubInicializaViewModelPrestador)
      _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventHubPrestadorAtualizaViewModel)
      _atualizaViewModel(blocEvent);
  }

/*  Future<ViewModelHubPrestador> _aplicaCidadeNoViewModel(BusinessModelDadosPrestador prestador, String idCidade) async {
    BusinessModelPrincipaisTiposDeServicoCidade principaisTiposDeServicoCidade = await ProviderPrincipaisTiposDeServicoCidade().getBusinessModel(idCidade);
    print(principaisTiposDeServicoCidade);

    ViewModelHubPrestador viewModel = ViewModelHubPrestador(
      prestador: prestador,
      cidade: principaisTiposDeServicoCidade.cidade,
      principaisTiposDeServicoCidade: principaisTiposDeServicoCidade,
    );
    return viewModel;
  }*/


  Future<List<BusinessModelDadosPrestador>> getPrestadores() async {
    List<BusinessModelDadosPrestador> listaTodosPrestadores = [];
    listaTodosPrestadores = await ProvideDadosPrestador().getBusinessModels();
    return listaTodosPrestadores;

  }

  Future<BusinessModelDadosPrestador> getPrestadorLogado() async {
    List<BusinessModelDadosPrestador> listaPrestadores = await getPrestadores();

    final FirebaseAuth auth = FirebaseAuth.instance;
    Future<String?> getUserId() async {
      final User? user = await auth.currentUser;
      final userId = user?.uid.toString();
      return userId;
    }

    BusinessModelDadosPrestador prestadorRetorno = BusinessModelDadosPrestador(
        name: 'namee',
        phone: 'phone',
        workingHours: 'workingHours',
        description: 'description',
        profilePicture: 'profilePicture',
        city: ['colatina - ES'],
        roles: [1, 2],
        numeroDeCliquesNoLigarOuWhatsApp: 0,
        dataVencimentoPlano: DateTime.now(),
        dataAberturaConta: DateTime.now(),
        IdPrestador: 'IdPrestador',
        tipoPlanoPrestador: 10, cliquesNoWhatsApp: 0, cliquesNoPerfil: 0, identityVerified: '');
    ;

    String? userId = await getUserId();

    if (userId != null) {
      print(listaPrestadores.length);
      listaPrestadores.forEach((element) {
        if (element.IdPrestador == userId) {

          prestadorRetorno = element;
        }
      });
    }

    return prestadorRetorno;

  }

  void _inicializaViewModel(
      BlocEventHubInicializaViewModelPrestador blocEvent) async {
    BusinessModelDadosPrestador prestador = await getPrestadorLogado();


    print(prestador);
    int newcodCidade =
        await GetCodCidade(nomeCidade: prestador.city[0]).action();
    BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico
        businessModelPrestadoresDeServicoPorCidadeTipoDeServico =
        await ProviderPrestadoresDeServicoPorCidadeTipoDeServico() //business model null
            .getBusinessModel(
                newcodCidade.toString() + "-" + prestador.roles[0].toString());

    print(businessModelPrestadoresDeServicoPorCidadeTipoDeServico);

    BusinessModelPrestadorDeServicos prestadorLogado =
        BusinessModelPrestadorDeServicos(
            codPrestadorServico: "0",
            description: "",
            nome: "Prestador",
            nota: 5,
            statusOnline: true,
            telefone: "1234567",
            tipoPlanoPrestador: 0,
            totalDeAvaliacoes: 1,
            totalDeAvaliacoesNota1: 0,
            totalDeAvaliacoesNota2: 0,
            totalDeAvaliacoesNota3: 0,
            totalDeAvaliacoesNota4: 0,
            totalDeAvaliacoesNota5: 1,
            urlFoto: "",
            cidades: [],
            servicos: [],
            workingHours: '',
            cliquesNoPerfil: 0,
            cliquesNoWhatsApp: 0);

    businessModelPrestadoresDeServicoPorCidadeTipoDeServico.prestadoresDeServico
        .forEach((element) {
      if (element.codPrestadorServico == prestador.IdPrestador) {
        prestadorLogado = element;
      }
    });

    String idCidadeDoprestador = "1"; // 1=colatina
    List<BusinessModelCidade> listaDeTodasAsCidades = [];

    Future<List<BusinessModelCidade>> getCidades() async {
      listaDeTodasAsCidades = await ProviderCidade().getBusinessModels();
      return listaDeTodasAsCidades;
    }

    List<BusinessModelCidade> cidades = await getCidades();
    List<BusinessModelCidade> _cidades = [];

    cidades.forEach((element) {
      if (prestador.city.contains(element.nome)) {
        _cidades.add(element);
      }
    });

    Future<List<BusinessModelTiposDeServico>> getTiposDeServico() async {
      List<BusinessModelTiposDeServico> listaTodosPrestadores = [];

      listaTodosPrestadores = await ProviderTiposDeServico().getBusinessModels();
      return listaTodosPrestadores;
    }

    List<BusinessModelTiposDeServico> tiposServico = await getTiposDeServico();
    List<BusinessModelTiposDeServico> _tiposServico = [];

    tiposServico.forEach((element) {
      if (prestador.roles.contains(element.codTipoServico)) {
        _tiposServico.add(element);
      }
    });

    List<BusinessModelAvaliacaoPrestadorDeServico>listaAvaliacoesPrestadorDeServico =
        (await GetAvaliacoesPrestador().action(prestador.IdPrestador))
            .cast<BusinessModelAvaliacaoPrestadorDeServico>();

    ViewModelHubPrestador viewModel = ViewModelHubPrestador(
      prestadorDeServicos: prestadorLogado,
      cidade: _cidades,
      listaAvaliacoesPrestadorDeServico: listaAvaliacoesPrestadorDeServico,
      prestador: prestador,
      tiposDeServico: _tiposServico,
    );
    this.sendViewModelOut(viewModel);
  }

  void _atualizaViewModel(
      BlocEventHubPrestadorAtualizaViewModel blocEvent) async {
    BusinessModelDadosPrestador prestadorTemp = BusinessModelDadosPrestador(
      dataAberturaConta: blocEvent.viewModel.prestador.dataAberturaConta,
      numeroDeCliquesNoLigarOuWhatsApp:
          blocEvent.viewModel.prestador.numeroDeCliquesNoLigarOuWhatsApp,
      profilePicture: blocEvent.viewModel.prestador.profilePicture,
      dataVencimentoPlano: blocEvent.viewModel.prestador.dataVencimentoPlano,
      IdPrestador: blocEvent.viewModel.prestador.IdPrestador,
      name: blocEvent.viewModel.prestador.name,
      phone: blocEvent.viewModel.prestador.phone,
      city: blocEvent.viewModel.prestador.city,
      description: blocEvent.viewModel.prestador.description,
      roles: blocEvent.viewModel.prestador.roles,
      workingHours: blocEvent.viewModel.prestador.workingHours,
      tipoPlanoPrestador: blocEvent.viewModel.prestador.tipoPlanoPrestador,
      cliquesNoWhatsApp: blocEvent.viewModel.prestador.cliquesNoWhatsApp,
      cliquesNoPerfil: blocEvent.viewModel.prestador.cliquesNoPerfil,
      identityVerified: blocEvent.viewModel.prestador.identityVerified,
    );

    ViewModelHubPrestador viewModelTmp = ViewModelHubPrestador(
      prestador: prestadorTemp,
      listaAvaliacoesPrestadorDeServico:
          blocEvent.viewModel.listaAvaliacoesPrestadorDeServico,
      prestadorDeServicos: blocEvent.viewModel.prestadorDeServicos,
      tiposDeServico: blocEvent.viewModel.tiposDeServico,
      cidade: blocEvent.viewModel.cidade,
    );
    this.sendViewModelOut(viewModelTmp);

    //String urlFoto = await Providerprestador().getUrlFotoById(prestador.id);

    debugPrint(blocEvent.viewModel.cidade[0].id);
  }
}
