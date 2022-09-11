import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../businessModels/businessModelTiposDeServico.dart';
import '../../../../provider/tiposDeServico/providerTiposDeServico.dart';
import '../../../../util/libraryComponents/popUps/popUpListaSelectCidades.dart';
import '../../selectCidades/viewActionsSelectCidade.dart';
import '../../selectCidades/viewModelSelectCidade.dart';
import '../../selectCities/stepTwo.dart';

class ButtonGoSignUpScreenSelectCidade extends StatelessWidget {
    final ViewActionsSelectCidade viewActions;
    final ViewModelSelectCidade viewModel;


   ButtonGoSignUpScreenSelectCidade({Key? key,
    required this.viewActions,
    required this.viewModel,
  }) : super(key: key);
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();


  // late var providerTiposDeServico;
  //
  //   @override
  //   void initState() {
  //     ProviderTiposDeServico  providerTiposDeServico = ProviderTiposDeServico();
  //     super.initState();
  //   }
    ProviderTiposDeServico? providerTiposDeServico;


  @override
  Widget build(BuildContext context) {
    //ProviderTiposDeServico providerTiposDeServico = ProviderTiposDeServico();

    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          RoundedLoadingButton(
            controller: _btnController,
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade900,
                      Colors.blue.shade500,
                      Colors.blue.shade400
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius:
                  BorderRadius.circular(30.0)),
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: 350.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  'Continuar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onPressed: () async   {
              this.viewActions.savarListaSelecionadaFirebase(viewModel);
              if(viewModel.cidadesSelecionadas.length < 1){
                mostrarErroEmailInvalido(context);
              }
              else{
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StepTwo()));
              }
              _btnController.reset();
            },
          ),
        ],
      ),
    );
  }
    Future mostrarErroEmailInvalido(context) => showDialog(
      context: context,
      builder: (context) => PopUpListaSelectCidades(),
    );
}

