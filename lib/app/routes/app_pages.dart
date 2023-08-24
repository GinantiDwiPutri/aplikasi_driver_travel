import 'package:get/get.dart';

import '../modules/blocked/bindings/blocked_binding.dart';
import '../modules/blocked/views/blocked_view.dart';
import '../modules/chat_room/bindings/chat_room_binding.dart';
import '../modules/chat_room/views/chat_room_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/help/bindings/help_binding.dart';
import '../modules/help/views/help_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_chat/bindings/list_chat_binding.dart';
import '../modules/list_chat/views/list_chat_view.dart';
import '../modules/list_order/bindings/list_order_binding.dart';
import '../modules/list_order/views/list_order_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/order_detail/bindings/order_detail_binding.dart';
import '../modules/order_detail/views/order_detail_view.dart';
import '../modules/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/privacy_policy/views/privacy_policy_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/terms_of_service/bindings/terms_of_service_binding.dart';
import '../modules/terms_of_service/views/terms_of_service_view.dart';
import '../modules/waiting/bindings/waiting_binding.dart';
import '../modules/waiting/views/waiting_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.BLOCKED,
      page: () => const BlockedView(),
      binding: BlockedBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_OF_SERVICE,
      page: () => const TermsOfServiceView(),
      binding: TermsOfServiceBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.HELP,
      page: () => const HelpView(),
      binding: HelpBinding(),
    ),
    GetPage(
      name: _Paths.WAITING,
      page: () => const WaitingView(),
      binding: WaitingBinding(),
      children: [
        GetPage(
          name: _Paths.WAITING,
          page: () => const WaitingView(),
          binding: WaitingBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.LIST_CHAT,
      page: () => const ListChatView(),
      binding: ListChatBinding(),
    ),
    GetPage(
      name: _Paths.LIST_ORDER,
      page: () => const ListOrderView(),
      binding: ListOrderBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAIL,
      page: () => const OrderDetailView(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_ROOM,
      page: () => const ChatRoomView(),
      binding: ChatRoomBinding(),
    ),
  ];
}
