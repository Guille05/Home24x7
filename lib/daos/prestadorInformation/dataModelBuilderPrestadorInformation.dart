import 'dataModePrestadorInformation.dart';



class DataModelBuilderPrestadorInfomation {
 final String IdUsuario;

 DataModelBuilderPrestadorInfomation({required this.IdUsuario});

  DataModelPrestadorInformation? createDataModel(Map<String, dynamic> json) {
    return DataModelPrestadorInformation(
      phone: json['phone'],
      city: json['City'],
      description:  json['description'],
      roles: json['job'],
      workingHours: json['workingHours'],
      brazilianID: json['idWorker'],
      brazilianIDPicture: json['idPicture'],
      profilePicture: json['profilePicture'],
      name: json['name'],
      IdUsuario: IdUsuario,
    );
  }

  @override
  Map<String, dynamic>? createJson(DataModelPrestadorInformation? dataModel) {
    if (dataModel == null) return null;
    return {"phone": dataModel.phone,
      "City": dataModel.city,
      "description": dataModel.description,
      "job": dataModel.roles,
      "workingHours": dataModel.workingHours,
      "idWorker": dataModel.brazilianID,
      "idPicture": dataModel.brazilianIDPicture,
      "profilePicture": dataModel.profilePicture,
      "name": dataModel.name,
    };
  }
}