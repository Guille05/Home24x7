import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../businessModels/businessModelTiposDeServico.dart';
import '../../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import '../viewActionsHub.dart';
import '../viewModelHub.dart';

class ViewHubGridView extends StatelessWidget {
  ViewHubGridView({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelHubUsuario viewModel;
  final ViewActionsHubUsuario viewActions;

  @override
  Widget build(BuildContext context) {
    return gridViewComInternet(context);
  }

  @override
  Widget gridViewComInternet(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 11,
          ),
          Row(
            children: [
              SizedBox(
                width: 11,
              ),
              Text("Already know which city? Quick search",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
                      Icon(Icons.arrow_downward, size: 20,)

            ],
          ),
          viewModel.principaisTiposDeServicoCidade.tiposDeServico.isNotEmpty
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                  ),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: _buildBotaoServico,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [CircularProgressIndicatorPersonalizado()],
                ),
        ],
      ),
    );
  }

  Widget _buildBotaoServico(BuildContext context, int index) {
    BusinessModelTiposDeServico tiposDeServico =
        viewModel.principaisTiposDeServicoCidade.tiposDeServico[index];
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.black,
            primary: Colors
                .white, //[Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400]
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            )),
        onPressed: () {
          viewActions.abreTelaMostraUsuarioesDeServico(
              context, viewModel, tiposDeServico.codTipoServico);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              tiposDeServico.icone,
              size: 80,
            ),
            //Image.asset("assets/image_2.png"),
            Text(tiposDeServico.descricao),
          ],
        ),
      ),
    );
  }
}
