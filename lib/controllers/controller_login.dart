import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:app_deborah/myglobal.dart' as global;
import '../models/user_model.dart';

class ControllerAuth {
  final user = UserSecureStorage();

  login(cpf, password) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        "http://10.0.2.2:8000/api/v1/integracao/auth/entrar/",
        data: {
          "cpf": cpf,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        var data = response.data;

        UserModel usermodel = UserModel(
          nome: data['user']['nome'],
          email: data['user']['email'],
          codigoac: data['user']['codigoac'],
          cod_filial: data['user']['cod_filial'],
          cod_setor: data['user']['cod_setor'],
          setor: data["user"]['setor'],
          funcao: data["user"]['funcao'],
          avatar: data["user"]['avatar'],
          cor_sistema: data["user"]['cor_sistema'],
          user_permissions: data["user"]['user_permissions'],
        );

        user.saveUser(usermodel);
        user.saveToken(data['token']);
        print('Token: ${data['token']}');

        global.user = await user.getUser();

        return true;
      }
    } on DioError catch (error) {
      print(error.response?.data);
    }

    return false;
  }
}

class UserSecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  Future<void> saveUser(model) async {
    await storage.write(key: 'user', value: UserModel.serialize(model));
    global.user = await getUser();
  }

  Future<UserModel> getUser() async {
    final data = await storage.read(key: 'user');
    UserModel model = UserModel.deserialize(data!);
    return model;
  }

  Future<void> signOut() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
    await storage.delete(key: 'user');
  }
}
