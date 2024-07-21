import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../guiding/presentation/user_profile_page.dart';
import '../../splash/presentation/splash_page.dart';
import 'package:guide_app/guiding/feat_guiding.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: "/"),
        AutoRoute(page: WelcomeRoute.page, path: "/welcome"),
        AutoRoute(page: ChooseRoleRoute.page, path: "/choose"),
        AutoRoute(page: ChooseLoginRoute.page, path: "/choose-login"),
        AutoRoute(page: UserRegisterRoute.page, path: "/user-register"),
        AutoRoute(page: UserLoginRoute.page, path: "/user-login"),
        AutoRoute(page: UserHomeRoute.page, path: "/user-home"),
        AutoRoute(page: UserEditRoute.page, path:"/user-update"),
        AutoRoute(page: UserProfileRoute.page, path:"/user-profile"),
        AutoRoute(page: UserDetailRoute.page, path:"/user-detail"),
        //teacher
        AutoRoute(page: TeacherLoginRoute.page, path:"/teacher-login"),
        AutoRoute(page: TeacherRegisterRoute.page, path: "/teacher-register"),
        AutoRoute(page: TeacherHomeRoute.page, path: "/teacher-home"),
        AutoRoute(page: TeacherProfileRoute.page, path: "/teacher-profile"),
        AutoRoute(page: TeacherEditRoute.page, path:"/teacher-edit"),
        AutoRoute(page: TeacherDetailRoute.page, path:"/teacher-detail"),
      ];
      
}