import 'package:flutter/cupertino.dart';//
import 'package:flutter/material.dart';//
import 'package:home24x7/features/pesquisaCidade/views/viewListaPesquisaCidades.dart';
import 'package:home24x7/framework/view.dart';
import 'package:home24x7/util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import 'package:home24x7/util/libraryComponents/colors/colors.dart';
import 'viewActionsPesquisaCidade.dart';//
import 'viewModelPesquisaCidade.dart';//
import 'views/viewHeaderPesquisaCidade.dart';

class ViewPesquisaCidade extends View<ViewModelPesquisaCidade, ViewActionsPesquisaCidade> {
  ViewPesquisaCidade({
    Key? key,
    ViewModelPesquisaCidade? viewModel,
    required ViewActionsPesquisaCidade viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    if (viewModel == null) {
      return Center(
        child: CircularProgressIndicatorPersonalizado(),
      );
    } else {
      return Scaffold(
        appBar:

        AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, size: 30, //change your color here
            ),
            toolbarHeight: 70,
            title: Text("Select the city in which \nthe service will be required", style: TextStyle(color: Colors.white),),
            centerTitle: true,
          backgroundColor: ColorAppBar,
        ),
        body: Container(
          color: BackgroundColorGrey,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                borderOnForeground: true,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                    child: ViewHeaderSelectCidadea(viewModel: viewModel!, viewActions: viewActions,),
                    ),
                  ),
              Flexible(
                flex: 2,
                child:

                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          "Select a city:", textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                              fontSize:
                              Theme.of(context).textTheme.bodyText2!.fontSize),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 39,
                child: ViewListaPesquisaCidade(
                    viewModel: viewModel!, viewAction: viewActions),
              )
            ],
          ),
        ),
      );
    }
  }
}
