import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home24x7/businessModels/businessModelDadosPrestador.dart';


class SetPrestadorInformationCompleta {
  String name;
  String phone;
  String workingHours;
  String description;
  String profilePicture;
  List<dynamic> comentarios;
  List<String> cidades;
  List<int> servicos;
  int numeroDeCliquesNoLigarOuWhatsApp;
  DateTime dataVencimentoPlano;
  DateTime dataAberturaConta;
  String brazilianIDPicture;
  int planoPrestador;

  SetPrestadorInformationCompleta({
    required this.name,
    required this.phone,
    required this.workingHours,
    required this.description,
    required this.profilePicture,
    required this.comentarios,
    required this.cidades,
    required this.servicos,
    required this.numeroDeCliquesNoLigarOuWhatsApp,
    required this.dataVencimentoPlano,
    required this.dataAberturaConta,
    required this.brazilianIDPicture,
    required this.planoPrestador,
  });
}

// name: json["name"],
// phone: json["phone"],
// workingHours: json["workingHours"],
// description: json["description"],
// profilePicture: json["profilePicture"],
// city: List<String>.from(json['City']),
// roles: List<int>.from(json["job"]),
// numeroDeCliquesNoLigarOuWhatsApp: json["clickWhatsApp"],
// dataVencimentoPlano: json["dueDate"].toDate(),
// dataAberturaConta: json["opendate"].toDate(),
// IdPrestador: json["IdWorker"],
// tipoPlanoPrestador: json["typeOfPlan"],
// cliquesNoPerfil: json["clickProfile"],
// identityVerified: json["identityVerified"],

class UpdateDadosPrestador {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final BusinessModelDadosPrestador prestador;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateDadosPrestador() async {
    await firestore.collection('workers').doc(await getUserId()).update({
      'description': prestador.description,
      'name': prestador.name,
      'phone': prestador.phone,
      'workingHours': prestador.workingHours,
    });
  }

  UpdateDadosPrestador({
    required this.prestador,
  });
}

class UpdateCidadePrestador {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final String cidades;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateCidadePrestador() async {
    await firestore.collection('workers').doc(await getUserId()).update({
      'City': cidades,
    });
  }

  UpdateCidadePrestador({required this.cidades});
}

class UpdateServicoPrestador {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final List<int> servicos;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateServicosPrestador() async {
    await firestore.collection('workers').doc(await getUserId()).update({
      'job': servicos,
    });
  }

  UpdateServicoPrestador({required this.servicos}) {
    this.servicos;
  }
}

class UpdateIdentidadePrestador {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final String identidade;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateIdentidadePrestador() async {
    await firestore.collection('workers').doc(await getUserId()).update({
      'idPicture': identidade,
    });
  }

  UpdateIdentidadePrestador({required this.identidade}) {
    this.identidade;
  }
}

class UpdateComentarioAvaliacao {
  CollectionReference dadosPrestador =
      FirebaseFirestore.instance.collection('workers');
  CollectionReference dadosUsuarios =
      FirebaseFirestore.instance.collection('users');

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getIdDoUsuario() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final String dataDoComentario;
  final double nota;
  final String textoComentario;
  final String idPrestador;

  // commentText
  // "love this guys from miami"
  // date
  // "10-12-2022"
  // rating
  // "5"
  // userEmail
  // "gbsc@gmail.com"
  // userid
  // "123@gmail.com"
  // workerId
  // "fefef"

  CollectionReference firestore =
      FirebaseFirestore.instance.collection('comment');
  updateComentarioAvaliacao() async {
    await firestore.add({
      'date': dataDoComentario,
      'rating': nota.toStringAsPrecision(1),
      'commentText': textoComentario,
      'userEmail': await FirebaseAuth.instance.currentUser?.email,
      'workerId': this.idPrestador,
      'userid': await FirebaseAuth.instance.currentUser?.email,
    });
  }

  UpdateComentarioAvaliacao({
    required this.dataDoComentario,
    required this.nota,
    required this.textoComentario,
    required this.idPrestador,
  }) {
    this.dataDoComentario;
    this.nota;
    this.textoComentario;
    this.idPrestador;
  }
}

class UpdateNumerosDeVisitasPerfil{
  final String idPrestador;
  UpdateNumerosDeVisitasPerfil({required this.idPrestador});


  CollectionReference numeroDeVissitas = FirebaseFirestore.instance.collection('workers');

  Future<int> getNumeroDeVisitasPerfil() async{
    DocumentSnapshot snapshot = await numeroDeVissitas.doc(idPrestador).get();
    var data = snapshot.data() as Map<String, dynamic>;
    var numeroVisitas = data['clickProfile'];
    return numeroVisitas;

  }

  Future<void> aumentarUmVisitas() async{
    await numeroDeVissitas.doc(idPrestador).update({
      'clickProfile': await getNumeroDeVisitasPerfil() + 1,
    });
  }
}



class UpdateNumerosCliquesWhatsAppLigar{
  final String idPrestador;
  UpdateNumerosCliquesWhatsAppLigar({required this.idPrestador});

  CollectionReference numeroDeVissitas = FirebaseFirestore.instance.collection('workers');

  Future<int> getNumeroDeVisitasPerfil() async{
    DocumentSnapshot snapshot = await numeroDeVissitas.doc(idPrestador).get();
    var data = snapshot.data() as Map<String, dynamic>;
    var numeroVisitas = data['clickWhatsApp'];
    return numeroVisitas;
  }

  Future<void> aumentarUmClick() async{
    await numeroDeVissitas.doc(idPrestador).update({
      'clickWhatsApp': await getNumeroDeVisitasPerfil() + 1,
    });
  }

}










