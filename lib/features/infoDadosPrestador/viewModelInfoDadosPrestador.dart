import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:home24x7/businessModels/businessModelCidade.dart';
import 'package:home24x7/businessModels/businessModelDadosPrestador.dart';
import 'package:home24x7/framework/viewModel.dart';
import 'package:image_picker/image_picker.dart';

class ViewModelInfoDadosPrestador extends ViewModel {
  final BusinessModelDadosPrestador prestador;
  final List<BusinessModelCidade> cidades;
  final Uint8List? imagemAtualizada;
  final List<BusinessModelCidade> listaCompletaCidade;

  ViewModelInfoDadosPrestador({
    required this.prestador,
    required this.cidades,
    required this.listaCompletaCidade,
    this.imagemAtualizada,
  }) : super();
}
