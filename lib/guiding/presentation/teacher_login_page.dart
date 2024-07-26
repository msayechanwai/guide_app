import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../all_feat.dart';
import '../shared/teacher_providers.dart';

@RoutePage()
class TeacherLoginPage extends ConsumerStatefulWidget {
  const TeacherLoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeacherLoginPageState();
}

class _TeacherLoginPageState extends ConsumerState<TeacherLoginPage> {
  final teacherNameController = TextEditingController();
  final pswdController = TextEditingController();
  bool _obscureText = true;
  bool isLoading = false; // Loading state

  Future<void> _login() async {
    setState(() {
      isLoading = true; // Set loading state to true when login starts
    });

    final teacherName = teacherNameController.text.trim();
    final password = pswdController.text.trim();

    if (teacherName.isEmpty || password.isEmpty) {
      setState(() {
        isLoading = false; // Set loading state to false if validation fails
      });
      _showAlertDialog('Error', 'Please fill in all fields');
      return;
    }

    // Login logic
    final result = await ref.read(teacherRepositoryProvider).loginTeacher(teacherName, password);

    result.fold(
      (error) {
        setState(() {
          isLoading = false; // Set loading state to false on error
        });
        _showAlertDialog('Error', '$error.message');
      },
      (teacher) async {
        if (teacher != null) {
          // Store teacher data in provider
          ref.read(currentTeacherProvider.notifier).state = teacher;

          // Save teacher data to SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('id', teacher.id);
          await prefs.setString('teacherName', teacher.teacherName);
          await prefs.setString('education', teacher.education);
          await prefs.setString('major',teacher.major);
          await prefs.setString('phno', teacher.phno);
          await prefs.setString('password', teacher.password);
          await prefs.setString('address', teacher.address);
          await prefs.setString('createdAt', teacher.createdAt.toIso8601String());

          setState(() {
            isLoading = false; // Set loading state to false on success
          });

          context.router.replace(TeacherHomeRoute());
        } else {
          setState(() {
            isLoading = false; // Set loading state to false on invalid login
          });
          _showAlertDialog('Error', 'Invalid teacher name or password');
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
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
                  "Teacher Login",
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
                  controller: teacherNameController,
                  decoration: InputDecoration(
                    hintText: "Name",
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
                  obscureText: _obscureText,
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
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: isLoading ? null : _login,
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(color: Colors.white),
                            SizedBox(width: 16),
                            Text("Logging in..."),
                          ],
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(fontSize: 16),
                        ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    backgroundColor: Colors.lightBlue[100],
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
                        context.router.push(const TeacherRegisterRoute());
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
