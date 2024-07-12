import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});
  
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
          // First row with image
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/welcome.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover),
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
                  Card(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/welcome.jpg', width: 50, height: 50),
                          const Text('IELTS'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/welcome.jpg', width: 50, height: 50),
                          const Text('TOFEL'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/welcome.jpg', width: 50, height: 50),
                          const Text('DULINGO'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/welcome.jpg', width: 50, height: 50),
                          const Text('Japan'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/welcome.jpg', width: 50, height: 50),
                          const Text('Korea'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/welcome.jpg', width: 50, height: 50),
                          const Text('Math'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/welcome.jpg', width: 50, height: 50),
                          const Text('7'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/welcome.jpg', width: 50, height: 50),
                          const Text('8'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/welcome.jpg', width: 50, height: 50),
                          const Text('9'),
                        ],
                      ),
                    ),
                  ),
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
              context.router.replaceNamed('/user-login');
              break;
            case 2:
              context.router.replaceNamed('/user-register');
              break;
          }
        },
      ), 
    ),
    );
  }
}
