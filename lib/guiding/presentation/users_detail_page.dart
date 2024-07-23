import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/feat_core.dart';
import '../feat_guiding.dart';
import '../shared/teacher_providers.dart';

@RoutePage()
class UserDetailPage extends ConsumerStatefulWidget {
  const UserDetailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends ConsumerState<UserDetailPage> {
  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  Future<void> getUserList() async {
    Future.microtask(
      () {
        ref.read(userListNotifierProvider.notifier).getUserList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final teacher = ref.watch(currentTeacherProvider);
    ref.listen(
      userListNotifierProvider,
      (previous, next) {
        next.when(
          initial: () => print("initial"),
          loading: () => print("loading"),
          empty: () => print("empty"),
          noInternet: () => print("noInternet"),
          success: (data) => print("success data => $data"),
          error: (error) => print("error"),
        );
      },
    );
    final listState = ref.watch(userListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("User"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white30,
      ),
      body: Container(
        color: Colors.white30,
        child: listState.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          empty: () => const Center(child: Text("Empty Data")),
          noInternet: () => const Center(child: Text("noInternet")),
          success: (uList) {
            return ListView.builder(
              itemCount: uList.length,
              itemBuilder: (context, index) {
                final formattedDate = DateFormat('dd-MM-yyyy').format(uList[index].createdat);
                return Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0), // Margin (left and right)
            child: Card(
                  color: Colors.lightBlue[50],
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${uList[index].username}'),
                        Text('Phone: ${uList[index].phno}'),
                        Text('Address: ${uList[index].address}'),
                        Text('CreatedAt: $formattedDate'),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          error: (err) => Center(child: Text(err.message ?? "Error - Try Again")),
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
              context.router.push(TeacherProfileRoute());
              break;
          }
        },
      ),
    );
  }
}
