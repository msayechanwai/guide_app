import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../all_feat.dart';
import '../feat_guiding.dart';

@RoutePage()
class UserRegisterPage extends ConsumerStatefulWidget {
  const UserRegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends ConsumerState<UserRegisterPage> {
  final userNameController = TextEditingController();
  final addressController = TextEditingController();
  final phnoController = TextEditingController();
  final pswdController = TextEditingController();
  bool isButtonDisabled = false;
  bool isLoading = false;
  bool isSuccess = false;
  bool _obsecureText = true;

  void clearFormFields() {
    userNameController.clear();
    addressController.clear();
    phnoController.clear();
    pswdController.clear();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userAddNotifierProvider,
      (previous, state) {
        print("userAddNotifierProvider => $state");
        state.maybeWhen(
          orElse: () {},
          loading: () {
            setState(() {
              isLoading = true;
              isButtonDisabled = true;
            });
          },
          success: (data) {
            setState(() {
              isLoading = false;
              isSuccess = true;
              isButtonDisabled = false; // Re-enable the button if needed
            });
            clearFormFields();
            // Show success message for a short duration before navigating
            Future.delayed(const Duration(seconds: 2), () {
              context.router.replace(const UserLoginRoute());
            });
          },
          error: (error) {
            setState(() {
              isLoading = false;
              isButtonDisabled = false;
            });
          },
        );
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
                  "User Registration",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Create your account",
                  style: TextStyle(fontSize: 20, color: Colors.grey[700]),
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
                  controller: phnoController,
                  decoration: InputDecoration(
                    hintText: "Your Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.lightBlue.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: _obsecureText,
                  controller: pswdController,
                  decoration: InputDecoration(
                    hintText: "Your Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.lightBlue.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obsecureText = !_obsecureText;
                        });
                      },
                      icon: Icon(_obsecureText ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: "Your Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.lightBlue.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.home),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: isButtonDisabled ? null : () {
                    setState(() {
                      isButtonDisabled = true;
                      isLoading = true;
                    });
                    UserModel user = UserModel(
                      username: userNameController.text,
                      address: addressController.text,
                      phno: phnoController.text,
                      password: pswdController.text,
                      createdat: DateTime.now(),
                      id: '',
                    );
                    print(user);
                    ref.read(userAddNotifierProvider.notifier).addUser(user);
                  },
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(color: Colors.white),
                            SizedBox(width: 16),
                            Text("Registering..."),
                          ],
                        )
                      : const Text(
                          "Register",
                          style: TextStyle(fontSize: 20),
                        ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.lightBlue[200],
                  ),
                ),
                if (isSuccess) ...[
                  const SizedBox(height: 20),
                  const Text(
                    "Registration Successful!",
                    style: TextStyle(color: Colors.green, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        context.router.push(const UserLoginRoute());
                      },
                      child: const Text(
                        "Login",
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
