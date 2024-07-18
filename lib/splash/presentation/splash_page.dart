import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../all_feat.dart';
import '../../guiding/domain/user_model.dart';
import '../../guiding/shared/user_providers.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    gotoNextPage();
  }

  Future<void> gotoNextPage() async {
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id');
    final username = prefs.getString('username');
    final phno = prefs.getString('phno');
    final password = prefs.getString('password');
    final address = prefs.getString('address');
    final createdAt = prefs.getString('createdat');

    if (userId != null && username != null && phno != null && password != null && address != null && createdAt != null) {
      ref.read(currentUserProvider.notifier).state = UserModel(
        id: userId,
        username: username,
        phno: phno,
        password: password,
        address: address,
        createdat: DateTime.parse(createdAt),
      );
      context.router.replace(const UserHomeRoute());
    } else {
      context.router.replace(const WelcomeRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
