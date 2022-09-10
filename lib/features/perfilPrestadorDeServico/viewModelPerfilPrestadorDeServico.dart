
import 'package:home24x7/businessModels/businessModelPrestadorInfomation.dart';
import 'package:home24x7/framework/viewModel.dart';
import '../../businessModels/businessModelPrestadorInfomation.dart';


class ViewModelPerfilPrestadorDeServico extends ViewModel {
  BusinessModelPrestadorInformation prestadorInformation;


  ViewModelPerfilPrestadorDeServico({ required this.prestadorInformation})
      : super();
}