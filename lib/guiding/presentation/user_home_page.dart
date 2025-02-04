import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../all_feat.dart';
import '../feat_guiding.dart';

@RoutePage()
class UserHomePage extends ConsumerStatefulWidget {
  const UserHomePage({super.key});

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends ConsumerState<UserHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //final currentUser = ref.watch(currentUserProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Guiding App',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
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
                    _buildCard('assets/images/welcome.jpg', 'DULINGO'),
                    _buildCard('assets/images/japan.jpg', 'JAPAN'),
                    _buildCard('assets/images/korea.jpg', 'KOREA'),
                    _buildCard('assets/images/thailand.jpg', 'THAILAND'),
                    _buildCard('assets/images/js.jpg', 'JavaScript'),
                    _buildCard('assets/images/java.jpg', 'JAVA'),
                    _buildCard('assets/images/python.jpg', 'Python'),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
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
      ),
    );
  }

   Widget _buildCard(String imagePath, String title) {
  return GestureDetector(
    onTap: () {
      context.router.push(
        TeacherListRoute(
          major: title,
        ),
      );
    },
    child: Card(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, width: 85.0, height: 85.0),
            Text(title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
