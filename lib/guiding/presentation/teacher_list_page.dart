import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../shared/teacher_providers.dart'; 

@RoutePage()
class TeacherListPage extends ConsumerStatefulWidget {
  final String major;

  const TeacherListPage({super.key, required this.major});

  @override
  ConsumerState<TeacherListPage> createState() => _TeacherListPageState();
}

class _TeacherListPageState extends ConsumerState<TeacherListPage> {
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
        title: Text('${widget.major} Teachers'),
        backgroundColor: Colors.lightBlue[50],
      ),
      body: Container(
        color: Colors.lightBlue[50], // Set the background color here
        child: listState.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          empty: () => const Center(child: Text("Empty Data")),
          noInternet: () => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off,
                  size: 80,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  "No Internet Connection",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          ),
          success: (teachers) {
            final filteredTeachers = teachers.where((teacher) => teacher.major == widget.major).toList();
            return filteredTeachers.isEmpty
                ? Center(child: Text('No teachers found for the selected major'))
                : ListView.builder(
                    itemCount: filteredTeachers.length,
                    itemBuilder: (context, index) {
                      final teacher = filteredTeachers[index];
                      final formattedDate = DateFormat('dd-MM-yyyy').format(teacher.createdAt);
                      return Card(
                        color: Colors.lightBlue[100],
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name: ${teacher.teacherName}'),
                              Text('Education : ${teacher.education}'),
                              Text('Major: ${teacher.major}'),
                              Text('Phone: ${teacher.phno}'),
                              Text('Email: ${teacher.address}'),
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
    );
  }
}
