import '../../businessModels/businessModelDadosPrestador.dart';
import '../../daos/dataWorker/dataModelDadosPrestador.dart';
import '../../framework/adapter.dart';

class AdapterDadosPrestador
    extends Adapter<BusinessModelDadosPrestador, DataModelDadosPrestador> {
  @override
  Future<BusinessModelDadosPrestador> createBusinessModel(
      DataModelDadosPrestador? dataModel) async {
    if (dataModel == null)
      return BusinessModelDadosPrestador.vazio();
    else
      return BusinessModelDadosPrestador(
        IdPrestador: dataModel.IdPrestador,
        phone: dataModel.phone,
        city: dataModel.city as List<String>,
        description: dataModel.description,
        roles: dataModel.roles as List<int>,
        workingHours: dataModel.workingHours,
        name: dataModel.name,
        dataAberturaConta: dataModel.dataAberturaConta,
        dataVencimentoPlano: dataModel.dataVencimentoPlano,
        numeroDeCliquesNoLigarOuWhatsApp: dataModel.numeroDeCliquesNoLigarOuWhatsApp,
        profilePicture: dataModel.name,
        tipoPlanoPrestador: dataModel.tipoPlanoPrestador,
        cliquesNoWhatsApp: dataModel.numeroDeCliquesNoLigarOuWhatsApp,
        cliquesNoPerfil: dataModel.cliquesNoPerfil,
        identityVerified: dataModel.identityVerified,
      );
  }

  @override
  Future<DataModelDadosPrestador> createDataModel(
      BusinessModelDadosPrestador businessModel) async {
    return DataModelDadosPrestador(
      phone: businessModel.phone,
      city: businessModel.city,
      description: businessModel.description,
      roles: businessModel.roles,
      workingHours: businessModel.workingHours,
      name: businessModel.name,
      profilePicture: businessModel.profilePicture,
      IdPrestador: businessModel.IdPrestador,
      dataAberturaConta: businessModel.dataAberturaConta,
      dataVencimentoPlano: businessModel.dataVencimentoPlano,
      numeroDeCliquesNoLigarOuWhatsApp: businessModel.numeroDeCliquesNoLigarOuWhatsApp,
      tipoPlanoPrestador: businessModel.tipoPlanoPrestador,
      cliquesNoPerfil: businessModel.cliquesNoPerfil,
      identityVerified: businessModel.identityVerified,
    );
  }
}
