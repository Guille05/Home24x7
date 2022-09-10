import 'package:home24x7/daos/city/dataModelBuilderCidade.dart';
import 'package:home24x7/daos/worker/dataModelBuilderPrestadorDeServicos.dart';
import 'package:home24x7/daos/worker/dataModelPrestadorDeServicos.dart';
import 'package:home24x7/framework/dataModelBuilder.dart';


import '../tiposDeServico/dataModelBuilderTipoDeServico.dart';
import 'dataModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';

class DataModelBuilderPrestadoresDeServicoPorCidadeTipoDeServico extends DataModelBuilder<DataModelPrestadoresDeServicoPorCidadeTipoDeServico> {
  @override
  DataModelPrestadoresDeServicoPorCidadeTipoDeServico? createDataModel(Map<String, dynamic> json) {
    // {
    //  "codCidade":1,
    //  "codTipoServico":3,
    //  "prestadoresServico":[
    //    {
    //      "codPrestadorServico":30,
    //      "nome":"Pedro",
    //      "telefone":"3333-3333",
    //      "urlFoto":"https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg",
    //      "nota":0.0,
    //      "totalDeAvaliacoes":0
    //    }
    //   ]
    //  }

    return DataModelPrestadoresDeServicoPorCidadeTipoDeServico(
      cidade: DataModelBuilderCidade().createDataModel(json["City"])!,
      tipoServico: DataModelBuilderTipoDeServico().createDataModel(json["typeService"])!,
      prestadoresServico: _getPrestadoresDeServicosoFromJson(json["prestadoresServico"]),
    );
  }

  List<DataModelPrestadorDeServicos> _getPrestadoresDeServicosoFromJson(List<dynamic> json) {
    List<DataModelPrestadorDeServicos> lista = List.empty(growable: true);
    json.forEach((element) {
      lista.add(DataModelBuilderPrestadorDeServicos().createDataModel(element)!);
    });
    return lista;
  }

  @override
  Map<String, dynamic>? createJson(DataModelPrestadoresDeServicoPorCidadeTipoDeServico? dataModel) {
    if (dataModel == null) return null;
    return {};
  }
}
