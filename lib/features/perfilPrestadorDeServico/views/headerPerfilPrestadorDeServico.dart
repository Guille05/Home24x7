import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../util/libraryComponents/colors/colors.dart';
import '../viewActionsPerfilPrestadorDeServico.dart';
import '../viewModelPerfilPrestadorDeServico.dart';
import 'changePerfilPrestadorDeServico.dart';

class HeaderPerfilPrestadorDeServico extends StatelessWidget {
  HeaderPerfilPrestadorDeServico(
  {Key? key, required this.viewModel, required this.viewActions, required});

final ViewModelPerfilPrestadorDeServico viewModel;
final ViewActionsPerfilPrestadorDeServico viewActions;


@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Container(
        color: BackgroundColorGrey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ChangePerfilPrestadorDeServico(
                                viewActions: viewActions,
                                viewModel: viewModel,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

}
