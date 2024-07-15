import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:guide_app/all_feat.dart';
import 'package:guide_app/guiding/domain/domain.dart';

@RoutePage()
class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  //UserModel currenUser;

  @override
  Widget build(BuildContext context) {
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
                _showPopupMenu(context);
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

  void _showPopupMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              context.router.pushNamed('/user-login');
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: const Text('Edit Info'),
            onTap: () {
              Navigator.pop(context);
              context.router.pushNamed('/user-login-update'); // Correct route name
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
            onTap: () {
              Navigator.pop(context);
              context.router.pushNamed('/user-login');
             // context.router.push(UserEditRoute(user: user))
            },
          ),
        ],
      ),
    );
  }
}