import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home24x7/features/pesquisaTipoServico/viewActionsPesquisaTipoServico.dart';
import 'package:home24x7/features/pesquisaTipoServico/viewModelPesquisaTipoServico.dart';
import 'package:home24x7/features/pesquisaTipoServico/views/viewPesquisaTipoServicoBody.dart';
import 'package:home24x7/framework/view.dart';
import '../../util/libraryComponents/colors/colors.dart';

class ViewPesquisaTipoServico extends View<ViewModelPesquisaTipoServico, ViewActionsPesquisaTipoServico> {
  ViewPesquisaTipoServico({
    Key? key,
    ViewModelPesquisaTipoServico? viewModel,
    required ViewActionsPesquisaTipoServico viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(title: const Text("Select service type",
        style: TextStyle(color: Colors.white),),
        backgroundColor: ColorAppBar,
        iconTheme: const IconThemeData(
          color: Colors.white,size: 30
        ),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    if (viewModel == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
          child: ViewPesquisaTipoServicoBody(
            context,
            viewActions: viewActions,
            viewModel: viewModel!,
          ));
    }
  }
}