import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home24x7/features/hubPrestador/views/viewHubPrestadorInfoPrestador.dart';
import '../viewActionsHub.dart';
import '../viewModelHub.dart';

class HubPrestadorDadosPrestador extends StatelessWidget {
  final ViewModelHubPrestador viewModel;
  final ViewActionsHubPrestador viewActions;

  HubPrestadorDadosPrestador({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                'My Account',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          Divider(
            thickness: .8,
            color: Colors.blueAccent,
          ),
          Row(children: [
            SizedBox(
              width: 16,
            ),
            Icon(
              Icons.account_circle_rounded,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //SizedBox(width: 10,),
                  Text(
                    'My full name',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 4,
                  ),

                  Text(
                    viewModel.prestadorDeServicos.nome,
                  ),
                ],
              ),
            ),
          ]),
          Divider(
            thickness: .8,
            color: Colors.blueAccent,
          ),
          Row(children: [
            SizedBox(
              width: 16,
            ),
            Icon(
              Icons.phone,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //SizedBox(width: 10,),
                  Text(
                    'My phone number',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 4,
                  ),

                  Text(
                    viewModel.prestadorDeServicos.telefone,
                  ),
                ],
              ),
            ),
          ]),
          Divider(
            thickness: .8,
            color: Colors.blueAccent,
          ),
          Row(children: [
            SizedBox(
              width: 16,
            ),
            Icon(
              Icons.lock_clock,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My work hours',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    viewModel.prestadorDeServicos.workingHours,
                  ),
                ],
              ),
            ),
          ]),
          Divider(
            thickness: .8,
            color: Colors.blueAccent,
          ),
          Row(children: [
            SizedBox(
              width: 16,
            ),
            Icon(
              Icons.description,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'A description of my services',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 1000,
                        maxWidth: _screenWidth * .72,
                      ),
                      child: Container(
                        //VER PQ TA DANDO ERRO . . .. . .

                        child: Text(
                          viewModel.prestadorDeServicos.description,
                        ),
                      )),
                ],
              ),
            ),
          ]),
          Divider(
            thickness: .8,
            color: Colors.blueAccent,
          ),
          Row(children: [
            SizedBox(
              width: 16,
            ),
            Icon(
              Icons.location_on,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My work locations',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  viewModel.cidade.length > 0
                      ? Container(
                          height: 40,
                          width: _screenWidth * .72,
                          child: ListView(
                              // This next line does the trick.
                              scrollDirection: Axis.horizontal,
                              children: List<Widget>.generate(
                                  viewModel.cidade.length, (int index) {
                                return Chip(
                                  backgroundColor: Colors.white,
                                  label: Text(viewModel.cidade[index].nome),
                                );
                              }),
                            ),
                          
                        )
                      : Text("No city registered."),
                ],
              ),
            ),
          ]),
          Divider(
            thickness: .8,
            color: Colors.blueAccent,
          ),
          Row(children: [
            SizedBox(
              width: 16,
            ),
            Icon(
              Icons.work,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'The services I provide',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  viewModel.tiposDeServico != null
                      ? Container(
                          height: 40,
                          width: _screenWidth * .72,
                          child: ListView(
                              // This next line does the trick.
                              scrollDirection: Axis.horizontal,
                              children: List<Widget>.generate(
                                  viewModel.tiposDeServico.length,
                                  (int index) {
                                return Chip(
                                  backgroundColor: Colors.white,
                                  label: Text(viewModel
                                      .tiposDeServico[index].descricao),
                                );
                              }),
                            ),
                        )
                      : Text("No services provided."),
                ],
              ),
            ),
          ]),
          Divider(
            thickness: .8,
            color: Colors.blueAccent,
          ),
          Row(children: [
            SizedBox(
              width: 16,
            ),
            Icon(
              Icons.star,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My job title',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    getplanoPrestador(
                        viewModel.prestadorDeServicos.tipoPlanoPrestador),
                  ),
                ],
              ),
            ),
          ]),
          Divider(
            thickness: .8,
            color: Colors.blueAccent,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Preview your page as a customer',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
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
                  borderRadius: BorderRadius.circular(30.0)),
              child: Container(
                constraints: BoxConstraints(maxWidth: 240.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  'Look at profile ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onPressed: () async {
              print(await FirebaseAuth.instance.currentUser?.email.toString());

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ViewHubPrestadorInfoPrestador(
                  viewModel: viewModel,
                  viewActions: viewActions,
                ),
              ));
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ),
          SizedBox(height: 16,),
        ],
      ),
    );
  }

  String getplanoPrestador(int tipoDeplano) {
    if (tipoDeplano == 0) return "Your trial period is still active";
    if (tipoDeplano == 1) return 'You have the Premium plan';
    if (tipoDeplano == 2) return 'You have the Normal plan';
    if (tipoDeplano == 3)
      return "Your profile is not being shown to our users, \n subscribe to one of our plans to continue \n making use of our services";
    return 'sssd';
  }
}
