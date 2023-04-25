import 'package:dio/dio.dart';
import 'controller_login.dart';

class ControllerCadastro {
  cadastro(String cpf, String email, String password,
      String confirmPassword) async {
    try {
      var dio = Dio();
      var response = await dio.post(
        "http://10.0.2.2:8000/api/v1/integracao/auth/cadastro/",
        data: {
          "cpf": cpf,
          "email": email,
          "password": password,
          "confirm_password": confirmPassword,
        },
      );
      if (response.statusCode == 201) {
        UserSecureStorage().saveToken(response.data);
        return response.data;
      }
    } catch (error) {
      print("Erro na requisição de cadastro: $error");
    }
  }
}
