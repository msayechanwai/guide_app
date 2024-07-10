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
  final addressController = TextEditingController();
  final phnoController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    ref.listen(
      userAddNotifierProvider,
      (previous, state) {
        //print("userAddNotifierProvider => $state");
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Enter Your Information",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
                const SizedBox(height: 40), // Adjusted this value to control spacing
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
                const SizedBox(height: 40), // Adjusted this value to control spacing
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      /*  UserModel user = UserModel(
                        username: userNameController.text,
                        address: addressController.text,
                        phno: phnoController.text,
                        createdat: DateTime.now(),
                        id: '',
                      ); 
                      print(user);
                      ref
                          .read(userAddNotifierProvider.notifier)
                          .addUser(user); */
                    },
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
