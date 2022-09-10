import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../viewActionsInfoPrestadorDeServico.dart';
import '../viewModelInfoPrestadorDeServico.dart';
import 'listItemAvaliacaoPrestadorDeServico.dart';

class ListViewListaAvaliacaoPrestadorDeServico extends StatelessWidget {
  final ViewModelInfoPrestadorDeServico viewModel;
  final ViewActionsInfoPrestadorDeServico viewActions;
  const ListViewListaAvaliacaoPrestadorDeServico({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    viewModel.listaAvaliacoesPrestadorDeServico.length == 0
        ? Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('There are no ratings for this worker.',
                style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.caption!.color, fontSize: 16),
              ),
            ),
          ),
          )
            : ListView.builder(
              itemCount: viewModel.listaAvaliacoesPrestadorDeServico.length,
              itemBuilder: (BuildContext context, int index) {
                return ListItemAvaliacaoPrestadorDeServico(
                  viewActions: viewActions,
                  avaliacao: viewModel.listaAvaliacoesPrestadorDeServico[index],
                );
              }
              );
          }
        }

