import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../all_feat.dart';
import '../feat_guiding.dart';

@RoutePage()
class UserHomePage extends ConsumerWidget {
  const UserHomePage({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Guiding App'),
        ),
        body: Column(
          children: [
            // First row with image slider
            Container(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: [
                  'assets/images/welcome.jpg',
                  'assets/images/welcome2.jpg',
                  'assets/images/welcome3.jpg',
                ].map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Image.asset(
                        imagePath,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            // Padding between image and cards
            const SizedBox(height: 8.0),
            // Second row with 6 cards in 2 rows and 3 columns
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 3,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: [
                    _buildCard('assets/images/ielts.jpg', 'IELTS'),
                    _buildCard('assets/images/tofel.jpg', 'TOFEL'),
                    _buildCard('assets/images/dulingo.jpg', 'DULINGO'),
                    _buildCard('assets/images/japan.jpg', 'Japan'),
                    _buildCard('assets/images/korea.jpg', 'Korea'),
                    _buildCard('assets/images/thailand.jpg', 'Thailand'),
                    _buildCard('assets/images/js.jpg', 'JavaScript'),
                    _buildCard('assets/images/java.jpg', 'Java'),
                    _buildCard('assets/images/python.jpg', 'Python'),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
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
            switch (index) {
              case 0:
                context.router.replaceNamed('/home');
                break;
              case 1:
                context.router.replaceNamed('/teacher-detail');
                break;
              case 2:
                _showPopupMenu(context, ref);
                break;
            }
          },
        ),
      ),
    );
  }

  Widget _buildCard(String imagePath, String title) {
    return Card(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, width: 70, height: 70),
            Text(title),
          ],
        ),
      ),
    );
  }

  void _showPopupMenu(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('user_id');
              await prefs.remove('username');

              ref.read(currentUserProvider.notifier).state = null;
              Navigator.pop(context);
              context.router.replaceAll([UserLoginRoute()]);
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: const Text('Edit Info'),
            onTap: () {
              Navigator.pop(context);
              context.router.push(UserEditRoute(user: currentUser!));
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: const Text('Delete'),
            onTap: () {
              Navigator.pop(context);
              _showDeleteConfirmationDialog(context, ref, currentUser!);
            },
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, WidgetRef ref, UserModel user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete your account?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              final result = await ref.read(userRepositoryProvider).deleteUser(user.id);
              result.fold(
                (error) => _showAlertDialog(context, 'Error', '$error.message'),
                (success) {
                  ref.read(currentUserProvider.notifier).state = null;
                  context.router.replaceAll([UserLoginRoute()]);
                },
              );
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog(BuildContext context, String title, String content) {
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
}
