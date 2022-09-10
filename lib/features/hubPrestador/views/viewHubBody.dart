import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home24x7/features/hubPrestador/views/viewHubPrestadorHeader.dart';
import '../../../businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import '../../../util/libraryComponents/colors/colorGradient.dart';
import '../../../util/libraryComponents/colors/colors.dart';
import '../viewActionsHub.dart';
import '../viewModelHub.dart';
import 'hubPrestadorDadosPrestador.dart';

class ViewHubBodyPrestador extends StatelessWidget {
  ViewHubBodyPrestador({
    Key? key,
    required this.viewModel,
    required this.viewActions,

  });

  final ViewModelHubPrestador viewModel;
  final ViewActionsHubPrestador viewActions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecorationColorGradient(context),
      child: Column(
        children: [
          ViewHubPrestadorHeader(
              viewModel: viewModel, viewActions: viewActions),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: Colors.blue.shade900,
                      spreadRadius: 1)
                ],
                color: BackgroundColorGrey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 12, left: 12, top: 0),
                child: SingleChildScrollView(
                  child:
                  HubPrestadorDadosPrestador(viewModel: viewModel, viewActions: viewActions,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
