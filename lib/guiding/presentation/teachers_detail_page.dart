import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/feat_core.dart';
import '../feat_guiding.dart';
import '../shared/teacher_providers.dart';

@RoutePage()
class TeacherDetailPage extends ConsumerStatefulWidget {
  //final List<TeacherModel> teacher;
  const TeacherDetailPage( {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeacherDetailPageState();
}

class _TeacherDetailPageState extends ConsumerState<TeacherDetailPage> {
  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    getTeacherList();
  }

  Future<void> getTeacherList() async {
    Future.microtask(
      () {
        ref.read(teacherListNotifierProvider.notifier).getTeacherList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    ref.listen(
      teacherListNotifierProvider,
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
    final listState = ref.watch(teacherListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Teachers"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue[50],
      ),
      body: Container(
        color: Colors.lightBlue[50],
        child: listState.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          empty: () => const Center(child: Text("Empty Data")),
          noInternet: () => const Center(child: Text("noInternet")),
          success: (tList) {
            return ListView.builder(
              itemCount: tList.length,
              itemBuilder: (context, index) {
                final formattedDate = DateFormat('dd-MM-yyyy').format(tList[index].createdAt);
                return Card(
                  color: Colors.lightBlue[100],
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${tList[index].teacherName}'),
                        Text('Education : ${tList[index].education}'),
                        Text('Major: ${tList[index].major}'),
                        Text('Phone: ${tList[index].phno}'),
                        Text('Email: ${tList[index].address}'),
                        Text('CreatedAt: $formattedDate'),
                      ],
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
 