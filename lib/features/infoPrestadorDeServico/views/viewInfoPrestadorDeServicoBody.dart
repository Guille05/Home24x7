import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home24x7/features/infoPrestadorDeServico/views/viewInfoPrestadorDeServicoDados.dart';
import '../../../util/libraryComponents/colors/colors.dart';
import '../viewActionsInfoPrestadorDeServico.dart';
import '../viewModelInfoPrestadorDeServico.dart';
import 'listViewListaAvaliacoesPrestadorDeServico.dart';

class ViewInfoPrestadorDeServicoBody extends StatelessWidget {
  ViewInfoPrestadorDeServicoBody({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelInfoPrestadorDeServico viewModel;
  final ViewActionsInfoPrestadorDeServico viewActions;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BackgroundColorGrey,
      child: Column(
        children: [
          ViewInfoPrestadorDeServicoDados(
            viewModel: viewModel,
            viewActions: viewActions,
          ),
          Expanded(
            child: ListViewListaAvaliacaoPrestadorDeServico(
              viewActions: viewActions,
              viewModel: viewModel,
            ),
          ),
        ],
      ),
    );
  }
}
