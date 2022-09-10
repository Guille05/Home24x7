import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home24x7/features/pesquisaTipoServico/views/viewHeaderPesquisaTipoServico.dart';
import 'package:home24x7/features/pesquisaTipoServico/views/viewListaTipoServico.dart';


import '../viewActionsPesquisaTipoServico.dart';
import '../viewModelPesquisaTipoServico.dart';


class ViewPesquisaTipoServicoBody extends StatelessWidget {
  ViewPesquisaTipoServicoBody(
      BuildContext context, {
        Key? key,
        required this.viewModel,
        required this.viewActions,
      });

  final ViewModelPesquisaTipoServico viewModel;
  final ViewActionsPesquisaTipoServico viewActions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ViewHeaderPesquisaTipoServico(viewModel: viewModel, viewActions: viewActions),
          ),
        ),
        ViewListaTipoServico(viewModel: viewModel, viewActions: viewActions),
      ],
    );
  }
}
