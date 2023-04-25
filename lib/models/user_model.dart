// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

class UserModel {
  final String nome;
  final String email;
  final int codigoac;
  final int cod_filial;
  final int cod_setor;
  final String setor;
  final String funcao;
  final String avatar;
  final String cor_sistema;
  final List<dynamic> user_permissions;

  UserModel(
      {required this.nome,
      required this.email,
      required this.codigoac,
      required this.cod_filial,
      required this.cod_setor,
      required this.setor,
      required this.funcao,
      required this.avatar,
      required this.cor_sistema,
      required this.user_permissions});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) => 
  UserModel(
        nome: jsonData['nome'],
        email: jsonData['email'],
        codigoac: jsonData['codigoac'],
        cod_filial: jsonData['cod_filial'],
        cod_setor: jsonData['cod_setor'],
        setor: jsonData['setor'],
        funcao: jsonData['funcao'],
        avatar: jsonData['avatar'],
        cor_sistema: jsonData['cor_sistema'],
        user_permissions: jsonData['user_permissions'],
      );

static Map<String, dynamic> toMap(UserModel model) =>

  <String, dynamic> {
    "nome": model.nome,
    "email": model.email,
    "codigoac": model.codigoac,
    "cod_filial": model.cod_filial,
    "cod_setor": model.cod_setor,
    "setor": model.setor,
    "funcao": model.funcao,
    "avatar": model.avatar,
    "cor_sistema": model.cor_sistema,
    "user_permissions": model.user_permissions,
  };

  static String serialize(UserModel model) =>
    json.encode(UserModel.toMap(model));

  static UserModel deserialize(String json) =>
    UserModel.fromJson(jsonDecode(json));
}
