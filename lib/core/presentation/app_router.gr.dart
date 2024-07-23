// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ChooseLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChooseLoginScreen(),
      );
    },
    ChooseRoleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChooseRoleScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    TeacherDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherDetailPage(),
      );
    },
    TeacherEditRoute.name: (routeData) {
      final args = routeData.argsAs<TeacherEditRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TeacherEditPage(
          args.teacher,
          key: args.key,
        ),
      );
    },
    TeacherHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherHomePage(),
      );
    },
    TeacherListRoute.name: (routeData) {
      final args = routeData.argsAs<TeacherListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TeacherListPage(
          key: args.key,
          major: args.major,
        ),
      );
    },
    TeacherLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherLoginPage(),
      );
    },
    TeacherProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherProfilePage(),
      );
    },
    TeacherRegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherRegisterPage(),
      );
    },
    UserDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserDetailPage(),
      );
    },
    UserEditRoute.name: (routeData) {
      final args = routeData.argsAs<UserEditRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserEditPage(
          args.user,
          key: args.key,
        ),
      );
    },
    UserHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserHomePage(),
      );
    },
    UserLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserLoginPage(),
      );
    },
    UserProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserProfilePage(),
      );
    },
    UserRegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserRegisterPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [ChooseLoginScreen]
class ChooseLoginRoute extends PageRouteInfo<void> {
  const ChooseLoginRoute({List<PageRouteInfo>? children})
      : super(
          ChooseLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChooseRoleScreen]
class ChooseRoleRoute extends PageRouteInfo<void> {
  const ChooseRoleRoute({List<PageRouteInfo>? children})
      : super(
          ChooseRoleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseRoleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherDetailPage]
class TeacherDetailRoute extends PageRouteInfo<void> {
  const TeacherDetailRoute({List<PageRouteInfo>? children})
      : super(
          TeacherDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeacherDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherEditPage]
class TeacherEditRoute extends PageRouteInfo<TeacherEditRouteArgs> {
  TeacherEditRoute({
    required TeacherModel teacher,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TeacherEditRoute.name,
          args: TeacherEditRouteArgs(
            teacher: teacher,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TeacherEditRoute';

  static const PageInfo<TeacherEditRouteArgs> page =
      PageInfo<TeacherEditRouteArgs>(name);
}

class TeacherEditRouteArgs {
  const TeacherEditRouteArgs({
    required this.teacher,
    this.key,
  });

  final TeacherModel teacher;

  final Key? key;

  @override
  String toString() {
    return 'TeacherEditRouteArgs{teacher: $teacher, key: $key}';
  }
}

/// generated route for
/// [TeacherHomePage]
class TeacherHomeRoute extends PageRouteInfo<void> {
  const TeacherHomeRoute({List<PageRouteInfo>? children})
      : super(
          TeacherHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeacherHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherListPage]
class TeacherListRoute extends PageRouteInfo<TeacherListRouteArgs> {
  TeacherListRoute({
    Key? key,
    required String major,
    List<PageRouteInfo>? children,
  }) : super(
          TeacherListRoute.name,
          args: TeacherListRouteArgs(
            key: key,
            major: major,
          ),
          initialChildren: children,
        );

  static const String name = 'TeacherListRoute';

  static const PageInfo<TeacherListRouteArgs> page =
      PageInfo<TeacherListRouteArgs>(name);
}

class TeacherListRouteArgs {
  const TeacherListRouteArgs({
    this.key,
    required this.major,
  });

  final Key? key;

  final String major;

  @override
  String toString() {
    return 'TeacherListRouteArgs{key: $key, major: $major}';
  }
}

/// generated route for
/// [TeacherLoginPage]
class TeacherLoginRoute extends PageRouteInfo<void> {
  const TeacherLoginRoute({List<PageRouteInfo>? children})
      : super(
          TeacherLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeacherLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherProfilePage]
class TeacherProfileRoute extends PageRouteInfo<void> {
  const TeacherProfileRoute({List<PageRouteInfo>? children})
      : super(
          TeacherProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeacherProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherRegisterPage]
class TeacherRegisterRoute extends PageRouteInfo<void> {
  const TeacherRegisterRoute({List<PageRouteInfo>? children})
      : super(
          TeacherRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeacherRegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserDetailPage]
class UserDetailRoute extends PageRouteInfo<void> {
  const UserDetailRoute({List<PageRouteInfo>? children})
      : super(
          UserDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserEditPage]
class UserEditRoute extends PageRouteInfo<UserEditRouteArgs> {
  UserEditRoute({
    required UserModel user,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UserEditRoute.name,
          args: UserEditRouteArgs(
            user: user,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UserEditRoute';

  static const PageInfo<UserEditRouteArgs> page =
      PageInfo<UserEditRouteArgs>(name);
}

class UserEditRouteArgs {
  const UserEditRouteArgs({
    required this.user,
    this.key,
  });

  final UserModel user;

  final Key? key;

  @override
  String toString() {
    return 'UserEditRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [UserHomePage]
class UserHomeRoute extends PageRouteInfo<void> {
  const UserHomeRoute({List<PageRouteInfo>? children})
      : super(
          UserHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserLoginPage]
class UserLoginRoute extends PageRouteInfo<void> {
  const UserLoginRoute({List<PageRouteInfo>? children})
      : super(
          UserLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserProfilePage]
class UserProfileRoute extends PageRouteInfo<void> {
  const UserProfileRoute({List<PageRouteInfo>? children})
      : super(
          UserProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserRegisterPage]
class UserRegisterRoute extends PageRouteInfo<void> {
  const UserRegisterRoute({List<PageRouteInfo>? children})
      : super(
          UserRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
