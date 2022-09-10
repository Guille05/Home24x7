import 'package:flutter/cupertino.dart';
import '../viewActionsPerfilPrestadorDeServico.dart';
import '../viewModelPerfilPrestadorDeServico.dart';
import 'headerPerfilPrestadorDeServico.dart';

class PerfilPrestadorDeServicoBody extends StatelessWidget {
  const PerfilPrestadorDeServicoBody(
      {Key? key, required this.viewModel, required this.viewActions})
      : super(key: key);

  final ViewModelPerfilPrestadorDeServico viewModel;
  final ViewActionsPerfilPrestadorDeServico viewActions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderPerfilPrestadorDeServico(
              viewModel: viewModel, viewActions: viewActions),
        ],
      ),
    );
  }
}
