// user_update_page.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../all_feat.dart';
import '../feat_guiding.dart';

@RoutePage()
class UserEditPage extends ConsumerStatefulWidget {
  final UserModel user;
  const UserEditPage(this.user, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserEditPageState();
}

class _UserEditPageState extends ConsumerState<UserEditPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phnoController = TextEditingController();
  final addressController = TextEditingController();
  bool _obsecureText = true;

  @override
  void initState() {
    super.initState();
    userNameController.text = widget.user.username;
    passwordController.text = widget.user.password;
    phnoController.text = widget.user.phno;
    addressController.text = widget.user.address;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userUpdateNotifierProvider,
      (previous, state) {
        print("userUpdateNotifierProvider => $state");
        state.maybeWhen(
          orElse: () {},
          success: (data) {
           // context.router.back();
           context.router.replace(const UserHomeRoute());
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
                  "Edit User Information",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Edit your account",
                  style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    hintText: "User Name",
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
                  controller: passwordController,
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
                      icon: Icon(_obsecureText ?Icons.visibility_off  : Icons.visibility),
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
              onPressed: () {
                UserModel user = UserModel(
                  username: userNameController.text,
                  phno: phnoController.text,
                  password: passwordController.text,
                  address: addressController.text,
                  createdat: widget.user.createdat,
                  id: widget.user.id,
                );
                print(user);
                ref.read(userUpdateNotifierProvider.notifier).updateUser(user);
              },
              style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.lightBlue[200],
                  ),
              child: const Text("Update"),
            ),
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}
