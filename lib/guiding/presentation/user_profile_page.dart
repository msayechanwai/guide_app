import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../all_feat.dart';
import '../feat_guiding.dart';

@RoutePage()
class UserProfilePage extends ConsumerWidget {
  final UserModel user;

  const UserProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
       backgroundColor:Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Colors.lightBlue[50],
      ),
      body: Padding(
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
            // Personal Information section
            const Text(
              'Personal Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Username: ${user.username}'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number: ${user.phno}'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address: ${user.address}'),
            ),
            // Edit Personal Info button
            ElevatedButton.icon(
              onPressed: () {
                context.router.push(UserEditRoute(user: user));
              },
              icon: Icon(Icons.edit),
              label: const Text('Edit Personal Info'),
            ),
            //const Spacer(),
            const SizedBox(height: 20.0),
            // Logout button
            ElevatedButton.icon(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('user_id');
                await prefs.remove('username');

                ref.read(currentUserProvider.notifier).state = null;
                context.router.replaceAll([UserLoginRoute()]);
              },
              icon: Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
