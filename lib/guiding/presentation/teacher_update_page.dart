import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../all_feat.dart';
import '../feat_guiding.dart';
import '../shared/teacher_providers.dart';

@RoutePage()
class TeacherEditPage extends ConsumerStatefulWidget {
  final TeacherModel teacher;
  const TeacherEditPage(this.teacher, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeacherEditPageState();
}

class _TeacherEditPageState extends ConsumerState<TeacherEditPage> {
  final teacherNameController = TextEditingController();
  final eduController =TextEditingController();
  final majorController= TextEditingController();
  final passwordController = TextEditingController();
  final phnoController = TextEditingController();
  final addressController = TextEditingController();
  bool _obsecureText = true;

  @override
  void initState() {
    super.initState();
    teacherNameController.text = widget.teacher.teacherName;
    eduController.text =widget.teacher.education;
    majorController.text = widget.teacher.major;
    phnoController.text = widget.teacher.phno;
    passwordController.text = widget.teacher.password;
    addressController.text = widget.teacher.address;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      teacherUpdateNotifierProvider,
      (previous, state) {
        state.maybeWhen(
          orElse: () {},
          success: (data) {
            // Update the current teacher in provider
            ref.read(currentTeacherProvider.notifier).state = data;
            // Replace to TeahcerProfilePage
            context.router.replace(const TeacherHomeRoute());
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
                  "Edit Teacher Information",
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
                    prefixIcon: const Icon(Icons.book),
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
                    prefixIcon: const Icon(Icons.star),
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
                      icon: Icon(
                          _obsecureText ? Icons.visibility_off : Icons.visibility),
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
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    TeacherModel teacher = TeacherModel(
                      teacherName: teacherNameController.text,
                      education: eduController.text,
                      major: majorController.text,
                      phno: phnoController.text,
                      password: passwordController.text,
                      address: addressController.text,
                      createdAt: widget.teacher.createdAt,
                      teacherId: widget.teacher.teacherId,
                    );
                    ref.read(teacherUpdateNotifierProvider.notifier).updateTeacher(teacher);
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
