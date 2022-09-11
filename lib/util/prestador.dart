

/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../businessModels/businessModelCidade.dart';
import '../businessModels/businessModelDadosPrestador.dart';
import '../provider/cidade/providerCidade.dart';
import '../provider/dadosPrestador/providerDadosPrestador.dart';

class PrestadorProvider with ChangeNotifier {

  static final PrestadorProvider provider = PrestadorProvider._internal();

  List<BusinessModelDadosPrestador> listaTodosPrestadores = [];

  factory PrestadorProvider() {
    return provider;
  }


  Future<void> getPrestadores() async {
    listaTodosPrestadores = await ProvideDadosPrestador().getBusinessModels();
  }

  Future<BusinessModelDadosPrestador> getPrestadorLogado() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    Future<String?> getUserId() async {
      final User? user = await auth.currentUser;
      final userId = user?.uid.toString();
      return userId;
    }

    BusinessModelDadosPrestador prestadorRetorno = BusinessModelDadosPrestador(
        name: 'name',
        phone: 'phone',
        workingHours: 'workingHours',
        description: 'description',
        profilePicture: 'profilePicture',
        city: ['colatina - ES'],
        roles: [1, 2],
        numeroDeCliquesNoLigarOuWhatsApp: 0,
        dataVencimentoPlano: DateTime.now(),
        dataAberturaConta: DateTime.now(),
        IdPrestador: 'IdPrestador',
        tipoPlanoPrestador: 10,
        cliquesNoWhatsApp: 0,
        cliquesNoPerfil: 0,
        identityVerified: '');
    ;

    String? userId = await getUserId();
    if (userId != null) {
      listaTodosPrestadores.forEach((element) {
        if (element.IdPrestador == userId) {
          prestadorRetorno = element;
        }
      });
    }

    return prestadorRetorno;
  }





  PrestadorProvider._internal();

}*/
