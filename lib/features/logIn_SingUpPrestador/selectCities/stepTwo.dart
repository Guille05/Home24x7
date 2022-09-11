import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:home24x7/features/logIn_SingUpPrestador/selectCities/viewHeaderPesquisaCidade.dart';
import 'package:home24x7/features/logIn_SingUpPrestador/selectCities/viewListSelectCities.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../../businessModels/businessModelTiposDeServico.dart';
import '../../../daos/firebase/updatePrestadorFirebase.dart';
import '../../../util/libraryComponents/buttons/genericLogSingUpButton.dart';
import '../../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import '../../../util/libraryComponents/colors/colors.dart';
import '../../../util/libraryComponents/popUps/popUpListaSelectServicos.dart';
import '../../../util/resposta_processamento.dart';
import '../signUpEplicandoTelaDocumentos/viewSignUpEplicandoTelaDocumentos.dart';

class StepTwo extends StatefulWidget {

  const StepTwo({Key? key,}) : super(key: key);

  @override
  _StepTwoState createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {


  List<String> jobs  =["Painter", "Plumber",
  "Weeding",
  "Carpenter",
  "Housekeeper",
  "Electrician",
  "Mechanic",
  "Bricklayer",
  "Welder",
  "Personal Driver",
  "Yard worker ",
  "Flooring Installers",
  "Minor Home Repair",
  "Freight small distances",
  "Freight Home moving",
  "Mounting",
  "Lift & Shift Furniture",
  "House Sitter/Caretaker",
  "Tutor",
  "Elderly support ",
  "Pet Sitter",
  "Extermination",
  "Tread ",
  "AC Repair"];

  @override
  Widget build(BuildContext context) {
    RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();
    double _ScreenWidth = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width-10;
    double screenHeight = MediaQuery.of(context).size.height/2;
    TextEditingController searchTextFieldWorker = TextEditingController();


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); //BoxDecorationColorGradient(context),

          }, icon: Icon(Icons.arrow_back, color: Color(0xff4cf2c7), size: 28.0),
        ),

        toolbarHeight: 70,
        title: const Text('Escolhaz uma ou mais\ncidades onde irá trabalhar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorAppBar,
      ),

      body: Column(
        children: [
          Card(
            borderOnForeground: true,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    controller: searchTextFieldWorker,
                    onChanged: (value) {
                      setState(() {
                        applyFilter(searchTextFieldWorker.text);

                      });

                    },
                    decoration: new InputDecoration(
                      filled: true,

                      fillColor: Colors.white,
                      prefixIcon: new Icon(Icons.search,
                        color: Colors.blue.shade800,
                      ),
                      labelText: "Pesquisa pela cidade",
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: _ScreenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selecione as cidades que voce pretende trabalhar",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .fontSize),
                    ),
                    Text(
                      "Cidades selecionadas: ${selectedJobs.length} ",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .fontSize),
                    ),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
            ),
          ),

          Container(
            height: 40,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: List<Widget>.generate(
                  selectedJobs.length, (int index) {
                return Chip(
                  backgroundColor: Colors.white,
                  label: Text(selectedJobs[index]),
                );
              }),
            ),
          ),


      Container(
        height: screenHeight,
        width: screenWidth,
        child: ListView.builder(
            itemCount: jobs.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: /*isCityInTheList(fil[index]) ?*/ Colors.white, /*: Colors.blue,*/
                child: ListTile(
                    onTap: () {
                      setState(() {
                        selectedJobs = selectedJobs;
                      });

                      addJobsToSelectedList(jobs[index]);


                    },
                    title: SubstringHighlight(
                      text: jobs[index],
                      caseSensitive: false,
                      overflow: TextOverflow.ellipsis,
                      term: 'provider.searchTextFieldCities.text',
                      textAlign: TextAlign.left,
                      textStyleHighlight: TextStyle(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                        backgroundColor:
                        Theme
                            .of(context)
                            .textTheme
                            .headline2!
                            .backgroundColor,
                      ),
                      words: false,
                    ),
                    leading: Icon(Icons.location_city)),
              );
            }),
      ),
            ],
          ),

      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: RoundedLoadingButton(
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
            onPressed: () async  {
              _savarListaSelecionadaFirebase(selectedJobs);
              if(selectedJobs.length < 1){
                mostrarErroEmailInvalido(context);
              }
              else{
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewsignUpEplicandoTelaDocumentos()));
              }
              _btnController.reset();
            },
          ),
        ),
      ),
    );
  }


  List<String> selectedJobs = [];
  List<String> filteredJobs = [];

  addJobsToSelectedList(String city){
    selectedJobs.add(city);
  }

  isCityInTheList(String city){
    for(int i = 0; i< selectedJobs.length; i++){
      if(selectedJobs.contains(city)){
         return true;
      }
      return false;
    }
  }


 void  loadData(BuildContext context )  {
    jobs.clear();
    filteredJobs.clear();
    jobs.forEach((element) {
      jobs.add(element);
      filteredJobs.add(element);
    });

  }


  void applyFilter(String value){
    int i = 0;
    filteredJobs.clear();
    if(value == ""){
      jobs.forEach((element) {
        filteredJobs.add(element);

      });
    }else{
      i++;
      jobs.forEach((worker) {
        if(jobs[i].toUpperCase().contains(value.toUpperCase())){
          filteredJobs.add(worker);
         }
        }
      );
    }
  }

  void _savarListaSelecionadaFirebase(selectedCities) {

    int index = 0;
    List<int> servicos = [];
    selectedCities.forEach((element) {
      servicos.add(index);
      index++;
    }
    );
    SetPrestadorInformationCompleta informacoesPrestador = GetIt.instance<SetPrestadorInformationCompleta>();
    informacoesPrestador.servicos = servicos;
  }

  Future mostrarErroEmailInvalido(context) => showDialog(
    context: context,
    builder: (context) => PopUpListaSelectServicos(),
  );
}




