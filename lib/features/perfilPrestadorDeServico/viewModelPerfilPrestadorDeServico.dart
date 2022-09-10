

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:home24x7/businessModels/businessModelPrestadorInfomation.dart';
import 'package:home24x7/framework/viewModel.dart';
import 'package:image_picker/image_picker.dart';


class ViewModelPerfilPrestadorDeServico extends ViewModel {
  BusinessModelPrestadorInformation prestadorInformation;


  ViewModelPerfilPrestadorDeServico({ required this.prestadorInformation})
      : super();
}