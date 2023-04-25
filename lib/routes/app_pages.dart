import 'package:app_deborah/routes/app_routes.dart';
import 'package:get/get.dart';
import '../pages_cadastro/cadastro_page.dart';
import '../pages_login/login_page.dart';
import '../pages_menu/menu_pages.dart';
import '../pages_perfil/profile_page.dart';
import '../pages_ponto_digital/ponto_inicio_page.dart';
import '../pages_ponto_gestores/ponto_gestor.dart';
import '../pages_prestacao_contas/contas.dart';

class AppPages {
  static final routes = {
    GetPage(name: AppRoutes.LOGIN, page: () => const HomePage()),
    GetPage(name: AppRoutes.CADASTRO, page: () => const CadastroPage()),
    GetPage(name: AppRoutes.MENU, page: () => const MenuPage()),
    GetPage(name: AppRoutes.PROFILE, page: () => const ProfilePage()),
    GetPage(name: AppRoutes.CONTAS, page: () => const ContasPage()),
    GetPage(name: AppRoutes.PONTO, page: () => const PontoPages()),
    GetPage(name: AppRoutes.PONTOGESTOR, page: () => const PontoGestores()),
    GetPage(name: AppRoutes.PONTOGESTOR, page: () => const PontoGestores()),
  };
}
