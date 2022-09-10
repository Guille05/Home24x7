import 'package:home24x7/framework/mixInDescricao.dart';

import '../framework/businessModel.dart';
class BusinessModelPrestadorDeServicos extends BusinessModel
    with MixInDescricao {
  final String codPrestadorServico;
  final String nome;
  final String telefone;
  final String urlFoto;
  final bool statusOnline;

  // final List<BusinessModelTiposDeServico> tiposDeServico;
  final double nota;
  final int totalDeAvaliacoes;
  final int totalDeAvaliacoesNota1;
  final int totalDeAvaliacoesNota2;
  final int totalDeAvaliacoesNota3;
  final int totalDeAvaliacoesNota4;
  final int totalDeAvaliacoesNota5;
  final String description;
  final int tipoPlanoPrestador;
  final List<String> cidades;
  final List<int> servicos;
  final String workingHours;
  final int cliquesNoPerfil;
  final int cliquesNoWhatsApp;

  BusinessModelPrestadorDeServicos({
    required this.codPrestadorServico,
    required this.nome,
    required this.telefone,
    required this.urlFoto,
    required this.statusOnline,
    required this.nota,
    required this.totalDeAvaliacoes,
    required this.totalDeAvaliacoesNota1,
    required this.totalDeAvaliacoesNota2,
    required this.totalDeAvaliacoesNota3,
    required this.totalDeAvaliacoesNota4,
    required this.totalDeAvaliacoesNota5,
    required this.description,
    required this.tipoPlanoPrestador,
    required this.cidades,
    required this.servicos,
    required this.workingHours,
    required this.cliquesNoPerfil,
    required this.cliquesNoWhatsApp,
  }) : super(id: codPrestadorServico.toString());

  factory BusinessModelPrestadorDeServicos.vazio() =>
      BusinessModelPrestadorDeServicos(
        codPrestadorServico: "0",
        nome: '',
        telefone: '',
        urlFoto: '',
        statusOnline: false,
        // tiposDeServico: List<BusinessModelTiposDeServico>.empty(growable: true),
        nota: 0,
        totalDeAvaliacoes: 0,
        totalDeAvaliacoesNota1: 0,
        totalDeAvaliacoesNota2: 0,
        totalDeAvaliacoesNota3: 0,
        totalDeAvaliacoesNota4: 0,
        totalDeAvaliacoesNota5: 0,
        description: '',
          tipoPlanoPrestador: 10,
        cidades: [''],
        servicos: [2000],
        workingHours: '',
        cliquesNoPerfil: 0,
        cliquesNoWhatsApp: 0,
      );

  @override
  String getDescricao() {
    return nome;
  }
}
