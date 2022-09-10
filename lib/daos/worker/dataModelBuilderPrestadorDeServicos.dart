import '../../framework/dataModelBuilder.dart';
import 'dataModelPrestadorDeServicos.dart';

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

class DataModelBuilderPrestadorDeServicos extends DataModelBuilder<DataModelPrestadorDeServicos> {
  @override
  DataModelPrestadorDeServicos? createDataModel(Map<String, dynamic> json) {
    return DataModelPrestadorDeServicos(
      codPrestadorServico: json["codPrestadorServico"],
      nome: json["name"],
      telefone: json["telefone"],
      urlFoto: json["urlFoto"],
      nota: double.parse(json["nota"].toString()),
      totalDeAvaliacoes: json["totalDeAvaliacoes"],
      totalDeAvaliacoesNota1: json["totalDeAvaliacoesNota1"],
      totalDeAvaliacoesNota2: json["totalDeAvaliacoesNota2"],
      totalDeAvaliacoesNota3: json["totalDeAvaliacoesNota3"],
      totalDeAvaliacoesNota4: json["totalDeAvaliacoesNota4"],
      totalDeAvaliacoesNota5: json["totalDeAvaliacoesNota5"],
      tipoPlanoPrestador: json["tipoPlanoPrestador"],
      cidades: json["city"],
      servicos: json["roles"],
      workingHours: json["workingHours"],
      cliquesNoPerfil: json["numeroDePessoasViramPerfilDessePrestador"],
      cliquesNoWhatsApp: json["numeroDeCliquesNoLigarOuWhatsApp"],
    );
  }

  @override
  Map<String, dynamic>? createJson(DataModelPrestadorDeServicos? dataModel) {
    if (dataModel == null) return null;
    return {
      "codPrestadorServico": dataModel.codPrestadorServico,
      "nome": dataModel.nome,
      "telefone": dataModel.telefone,
      "urlFoto": dataModel.urlFoto,
      "nota": dataModel.nota,
      "totalDeAvaliacoes": dataModel.totalDeAvaliacoes,
      "totalDeAvaliacoesNota1": dataModel.totalDeAvaliacoesNota1,
      "totalDeAvaliacoesNota2": dataModel.totalDeAvaliacoesNota2,
      "totalDeAvaliacoesNota3": dataModel.totalDeAvaliacoesNota3,
      "totalDeAvaliacoesNota4": dataModel.totalDeAvaliacoesNota4,
      "totalDeAvaliacoesNota5": dataModel.totalDeAvaliacoesNota5,
    };
  }
}
