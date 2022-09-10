import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class GetListaServicosFirebase {
  Future<List<String>> getListaServicosFirebase() async {
    CollectionReference servico =
        await FirebaseFirestore.instance.collection('listService');
    DocumentSnapshot listaDeServicoFirebase = await servico.doc('1').get();
    var mapServices = listaDeServicoFirebase.data() as Map<String, dynamic>;
    List<String> listaDeServico = mapServices['list'].cast<String>();
    return listaDeServico;
  }
}
