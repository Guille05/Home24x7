import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../businessModels/businessModelAvaliacaoPrestadorDeServico.dart';

class GetAvaliacoesPrestador {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<List<BusinessModelAvaliacaoPrestadorDeServico>> action(
      String idPrestador) async {
    List<BusinessModelAvaliacaoPrestadorDeServico> listaComentarios = [];
    QuerySnapshot query = await _instance
        .collection('comment')
        .where('IdWorker', isEqualTo: idPrestador)
        .get();

    List docs = query.docs;
    docs.forEach((element) {
      listaComentarios.add(
        BusinessModelAvaliacaoPrestadorDeServico(
          codPrestadorDeServico: element['IdWorker'],
          comentario: element['commentText'],
          data: element['date'],
          nota: int.parse(element['rating']),
          idUsuario: element['userid'],
          emailUsuario: element['userEmail'],
        ),
      );
    });
    return listaComentarios;
  }
}
