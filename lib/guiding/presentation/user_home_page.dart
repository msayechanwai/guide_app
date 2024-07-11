
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // Second row with 6 cards in 2 rows and 3 columns
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(9.0),
              crossAxisCount: 3,
              childAspectRatio: 3 / 3,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: const [
                Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.image, size: 50),
                        Text('IELTS'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.image, size: 50),
                        Text('TOFEL'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.image, size: 50),
                        Text('DULINGO'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.image, size: 50),
                        Text('Japan'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.image, size: 50),
                        Text('Korea'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.image, size: 50),
                        Text('Math'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.image, size: 50),
                        Text('7'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.image, size: 50),
                        Text('8'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.image, size: 50),
                        Text('9'),
                      ],
                    ),
                  ),
                ),
              ],
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
    );
  }
}
