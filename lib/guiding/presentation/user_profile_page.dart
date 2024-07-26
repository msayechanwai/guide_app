
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../all_feat.dart';
import '../feat_guiding.dart';

@RoutePage()
class UserProfilePage extends ConsumerStatefulWidget {
  const UserProfilePage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends ConsumerState<UserProfilePage> {
  int selectedIndex = 2; // Initial index for the "Me" tab

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text("Personal Information"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              if (user != null) {
                context.router.push(UserEditRoute(user: user));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('User data is not available')),
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
                await prefs.remove('user_id');
                await prefs.remove('username');

                ref.read(currentUserProvider.notifier).state = null;
                context.router.replaceAll([UserLoginRoute()]);
              }
            },
          ),
        ],
      ),
      body: user == null
          ? const Center(child: Text("No user data available"))
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
                        color: Colors.grey[300],
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
                    title: Text('Name : ${user.username}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Phone : ${user.phno}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Address: ${user.address}'),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Teacher',
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
              context.router.replaceNamed('/user-home');
              break;
            case 1:
              context.router.replaceNamed('/teacher-detail');
              break;
            case 2:
              context.router.push(UserProfileRoute());
              break;
          }
        },
      ),
    );
  }
}
