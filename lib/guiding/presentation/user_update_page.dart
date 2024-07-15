import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
            context.router.back();
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Edit User")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: userNameController,
              decoration: const InputDecoration(labelText: "Edit Your Name"),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: phnoController,
              decoration: const InputDecoration(labelText: "Phone Number"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(labelText: "Address"),
            ),
            const SizedBox(height: 30),
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
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
