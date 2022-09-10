import 'package:cloud_firestore/cloud_firestore.dart';

class GetQtdePrestadoresDeServicoPorTipoSeervicoECidade {
  final String idCidade;
  final int idServico;
GetQtdePrestadoresDeServicoPorTipoSeervicoECidade({required this.idCidade, required this.idServico});

  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  Future<int> action() async {
    QuerySnapshot query = await _instance
        .collection('worker')
        .where('City', arrayContainsAny: [idCidade]).get();

    List docs = query.docs;
    docs.removeWhere((element) {
      return !(element['job'] as List).contains(idServico);
    });

    /*print('------------------------------');
    print('Quantidade de prestadores em ' +
        idCidade +
        ' que prestam o serviço ' +
        idServico.toString() +
        ': ' +
        docs.length.toString());*/

    return docs.length;
  }
}
