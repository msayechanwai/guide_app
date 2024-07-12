import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guide_app/all_feat.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../feat_guiding.dart';

@RoutePage()
class UserLoginPage extends ConsumerStatefulWidget {
  const UserLoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends ConsumerState<UserLoginPage> {
  final userNameController = TextEditingController();
  final pswdController = TextEditingController();

  Future<void> _login() async {
    final username = userNameController.text.trim();
    final password = pswdController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showAlertDialog('Error', 'Please fill in all fields');
      return;
    }

    // Login logic
    final result = await ref.read(userRepositoryProvider).loginUser(username, password);

    result.fold(
      (error) {
        _showAlertDialog('Error', '$error.message');
      },
      (user) {
        if (user != null) {
          context.router.push(const UserHomeRoute());
        } else {
          _showAlertDialog('Error', 'Invalid username or password');
        }
      },
    );
  }

  void _showAlertDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userAddNotifierProvider,
      (previous, state) {
        state.maybeWhen(
            orElse: () {},
            success: (data) {
              // context.router.back();
            });
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 60.0),
                const Text(
                  "User Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Enter Your Information",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.lightBlue.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: pswdController,
                  decoration: InputDecoration(
                    hintText: "Your Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.lightBlue.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.password),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    backgroundColor: Colors.lightBlue[200],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        context.router.push(const UserRegisterRoute());
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
