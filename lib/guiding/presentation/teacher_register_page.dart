import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../all_feat.dart';
import '../feat_guiding.dart';
import '../shared/teacher_providers.dart';

@RoutePage()
class TeacherRegisterPage extends ConsumerStatefulWidget {
  const TeacherRegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeacherRegisterPageState();
}

class _TeacherRegisterPageState extends ConsumerState<TeacherRegisterPage> {
  final teacherNameController = TextEditingController();
  final eduController = TextEditingController();
  final majorController = TextEditingController();
  final addressController = TextEditingController();
  final phnoController = TextEditingController();
  final pswdController = TextEditingController();
  bool isButtonDisabled = false;
  bool isLoading = false;
  bool isSuccess = false;
  bool _obsecureText = true;

  void clearFormFields() {
    teacherNameController.clear();
    eduController.clear();
    majorController.clear();
    addressController.clear();
    phnoController.clear();
    pswdController.clear();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      teacherAddNotifierProvider,
      (previous, state) {
        print("teacherAddNotifierProvider => $state");
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
              context.router.replace(const TeacherLoginRoute());
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 50,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 60.0),
                    const Text(
                      "Teacher Registration",
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
                      controller: teacherNameController,
                      decoration: InputDecoration(
                        hintText: "Teacher Name",
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
                      controller: eduController,
                      decoration: InputDecoration(
                        hintText: "Education",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.lightBlue.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.grade),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: majorController,
                      decoration: InputDecoration(
                        hintText: "Major",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.lightBlue.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.book),
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
                          icon: Icon(_obsecureText
                              ? Icons.visibility_off
                              : Icons.visibility),
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
                        prefixIcon: const Icon(Icons.location_on),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: isButtonDisabled
                          ? null
                          : () {
                              setState(() {
                                isButtonDisabled = true;
                                isLoading = true;
                              });
                              TeacherModel teacher = TeacherModel(
                                teacherName: teacherNameController.text,
                                education: eduController.text,
                                major: majorController.text,
                                address: addressController.text,
                                phno: phnoController.text,
                                password: pswdController.text,
                                createdAt: DateTime.now(),
                                id: '',
                              );
                              print(teacher);
                              ref
                                  .read(teacherAddNotifierProvider.notifier)
                                  .addTeacher(teacher);
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
                        backgroundColor: Colors.lightBlue[100],
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
                            context.router.push(const TeacherLoginRoute());
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
        ),
      ),
    );
  }
}
