import 'package:home24x7/framework/dataModelBuilder.dart';
import 'dataModelDadosPrestador.dart';

class DataModelBuilderDadosPrestador
    extends DataModelBuilder<DataModelDadosPrestador> {
  @override
  DataModelDadosPrestador? createDataModel(Map<String, dynamic> json) {

    return DataModelDadosPrestador(
      name: json["name"],
      phone: json["phone"],
      workingHours: json["workingHours"],
      description: json["description"],
      profilePicture: json["profilePicture"],
      city: List<String>.from(json['City']),
      roles: List<int>.from(json["job"]),
      numeroDeCliquesNoLigarOuWhatsApp: json["clickWhatsApp"],
      dataVencimentoPlano: json["dueDate"].toDate(),
      dataAberturaConta: json["opendate"].toDate(),
      IdPrestador: json["IdWorker"],
      tipoPlanoPrestador: json["typeOfPlan"],
      cliquesNoPerfil: json["clickProfile"],
      identityVerified: json["identityVerified"],
    );
  }

  @override
  Map<String, dynamic>? createJson(DataModelDadosPrestador? dataModel) {
    if (dataModel == null) return null;
    return {
      "name": dataModel.name,
      "phone": dataModel.phone,
      "workingHours": dataModel.workingHours,
      "description": dataModel.description,
      "profilePicture": dataModel.profilePicture,
      "City": dataModel.city,
      "job": dataModel.roles,
      "clickWhatsApp":
          dataModel.numeroDeCliquesNoLigarOuWhatsApp,
      "dueDate": dataModel.dataVencimentoPlano,
      "opendate": dataModel.dataAberturaConta,
      "IdWorker": dataModel.IdPrestador,
    };
  }
}
