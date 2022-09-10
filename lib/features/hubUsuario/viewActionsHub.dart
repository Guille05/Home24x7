import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';

import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';

import 'package:projeto_treinamento/features/hubUsuario/viewModelHub.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/presenterListaPrestadoresDeServico.dart';

import 'package:projeto_treinamento/features/pesquisaTipoServico/presenterPesquisaTipoServico.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';

import '../../util/getCodigoCidade.dart';

import '../pesquisaCidade/presenterPesquisaCidade.dart';
import 'blocEventHub.dart';

class ViewActionsHubUsuario extends ViewActions<BlocEventHubUsuario> {
  ViewActionsHubUsuario(Pipe<BlocEventHubUsuario> blocPipeIn)
      : super(blocPipeIn);

  void abreTelaMostraUsuarioesDeServico(BuildContext context,
      ViewModelHubUsuario viewModel, int codTipoDeServico) async {
    print(viewModel.cidade.codCidade);
    int newcodCidade =
        await GetCodCidade(nomeCidade: viewModel.cidade.nome).action();
    print(newcodCidade);
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            PresenterListaPrestadoresDeServico.presenter(
                codTipoDeServico: codTipoDeServico, codCidade: newcodCidade),
      ),
    )
        .then((codTipoDeServico) {
      // ??
    });
  }

  void abreTelaDePesquisaDeCidade(
      BuildContext context, ViewModelHubUsuario viewModel) {
    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (BuildContext context) =>
                PresenterPesquisaCidade.presenter(codTipoDeServico: 0)))
        .then((codCidade) async {
      if (codCidade != null) {
        print(codCidade);
        int newcodCidade = await GetCodCidade(nomeCidade: codCidade).action();
        print(newcodCidade);
        BlocEventHubSelecionaCidade blocEvent = BlocEventHubSelecionaCidade(
            viewModel: viewModel, codCidade: newcodCidade);
        blocPipeIn.send(blocEvent);
      }
    });
  }

  void abreTelaDePesquisaDeTipoDeServico(
      BuildContext context, ViewModelHubUsuario viewModel) {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            PresenterPesquisaTipoServico.presenter(
                principaisTiposDeServicoCidade:
                    viewModel.principaisTiposDeServicoCidade),
      ),
    )
        .then((codTipoDeServico) async {
      if (codTipoDeServico != null) {
        print(viewModel.cidade.id);
        int newcodCidade =
            await GetCodCidade(nomeCidade: viewModel.cidade.nome).action();
        print(newcodCidade);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) =>
                PresenterListaPrestadoresDeServico.presenter(
                    codTipoDeServico: codTipoDeServico,
                    codCidade: newcodCidade),
          ),
        );
      }
    });
  }

  void AtualizaTelaHub(ViewModelHubUsuario viewModel) {
    BlocEventHubUsuarioAtualizaViewModel blocEvent =
        BlocEventHubUsuarioAtualizaViewModel(viewModel: viewModel);
    blocPipeIn.send(blocEvent);
  }
}
