import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../all_feat.dart';
import '../shared/teacher_providers.dart';

@RoutePage()
class TeacherProfilePage extends ConsumerStatefulWidget {
  const TeacherProfilePage({super.key});

  @override
  _TeacherProfilePageState createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends ConsumerState<TeacherProfilePage> {
  int selectedIndex = 2; // Initial index for the "Me" tab

  @override
  Widget build(BuildContext context) {
    final teacher = ref.watch(currentTeacherProvider);

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue[50],
        title: const Text("Personal Information"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              if (teacher != null) {
                context.router.push(TeacherEditRoute(teacher: teacher));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Teacher data is not available')),
                );
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              bool? result = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Logout Confirmation'),
                    content: Text('Are you sure you want to logout?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      TextButton(
                        child: Text('Logout'),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ],
                  );
                },
              );

              if (result == true) {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('teacherId');
                await prefs.remove('teacherName');

                ref.read(currentTeacherProvider.notifier).state = null;
                context.router.replaceAll([TeacherLoginRoute()]);
              }
            },
          ),
        ],
      ),
      body: teacher == null
          ? const Center(child: Text("No teacher data available"))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 150.0,
                        color: Colors.lightBlue[100],
                      ),
                      Positioned(
                        bottom: -50,
                        child: CircleAvatar(
                          radius: 60.0,
                          backgroundImage: AssetImage('assets/images/welcome.jpg'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70.0),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Name : ${teacher.teacherName}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text('Name : ${teacher.education}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Name : ${teacher.major}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Phone : ${teacher.phno}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Address: ${teacher.address}'),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          switch (index) {
            case 0:
              context.router.replaceNamed('/teacher-home');
              break;
            case 1:
              context.router.replaceNamed('/user-detail');
              break;
            case 2:
              context.router.push(TeacherProfileRoute(teacher: teacher!));
              break;
          }
        },
      ),
    );
  }
}
