import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customEditPrestadorInformation.dart';
import '../viewActionsPerfilPrestadorDeServico.dart';
import '../viewModelPerfilPrestadorDeServico.dart';

class ChangePerfilPrestadorDeServico extends StatelessWidget {
  const ChangePerfilPrestadorDeServico(
      {Key? key, required this.viewModel, required this.viewActions})
      : super(key: key);

  final ViewModelPerfilPrestadorDeServico viewModel;
  final ViewActionsPerfilPrestadorDeServico viewActions;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /*   CustomTextEditor<BusinessModelUsuario>(
                        labelText: "Nome",
                        iconData: Icons.account_box,
                        item: this.viewModel.usuario,
                        onEditionComplete: (String novoNome) {
                          this.viewActions.onChangeName(novoNome, viewModel);
                        },
                      ),*/
                      Divider(),
                      CustomEditPrestadorInformationNome(
                        labelText: "Name",
                        iconData: Icons.account_box,
                        item: this.viewModel.prestadorInformation.nome,
                        hintText: 'Enter your name',
                        onEditionComplete: (String novoNome) {
                          this.viewActions.onChangeName(novoNome, viewModel);
                        },
                      ),
                      Divider(),
                      CustomEditPrestadorInformationTelefone(
                        labelText: "Phone number",
                        iconData: Icons.phone,
                        item: this.viewModel.prestadorInformation.phone,
                        hintText: 'Enter your phone number',
                        onEditionComplete: (String novoNumero) {
                          this.viewActions.onChangeNumero(
                              novoNumero, viewModel);
                        },
                      ),
                      Divider(),
                      CustomEditPrestadorInformationServicosPrestados(
                        labelText: "Services offered",
                        iconData: Icons.work,
                        item: this.viewModel.prestadorInformation.roles,
                        hintText: 'Enter here',
                        onEditionComplete: (String novosServicos) {
                          this.viewActions.onChangeServicosPrestados(
                              novosServicos, viewModel);
                        },
                      ),
                      Divider(),
                      CustomEditPrestadorInformationHorasDeTrabaho(
                        labelText: "Working hours",
                        iconData: Icons.lock_clock,
                        item: this.viewModel.prestadorInformation.workingHours,
                        hintText: 'Enter here',
                        onEditionComplete: (String novasHoras) {
                          this.viewActions.onChangeHorasTrabalhadas(
                              novasHoras, viewModel);
                        },
                      ),
                      Divider(),
                      CustomEditPrestadorInformationDescricao(
                        labelText: "Description",
                        iconData: Icons.description,
                        item: this.viewModel.prestadorInformation.description,
                        hintText: 'Write a description',
                        onEditionComplete: (String novaDescricao) {
                          this.viewActions.onChangeDescricao(
                              novaDescricao, viewModel);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
