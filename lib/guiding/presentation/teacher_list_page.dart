import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this import
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

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
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
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Container(
        color: Colors.lightBlue[100], // Set the background color here
        child: listState.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          empty: () => const Center(child: Text("Empty Data")),
          noInternet: () => const Center(
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
                ? const Center(child: Text('No teachers found for the selected major'))
                : ListView.builder(
                    itemCount: filteredTeachers.length,
                    itemBuilder: (context, index) {
                      final teacher = filteredTeachers[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Card(
                        color: Colors.lightBlue[50],
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.account_box_rounded),
                                  SizedBox(width: 8),
                                  Text('${teacher.teacherName}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.school),
                                  SizedBox(width: 8),
                                  Text('${teacher.education}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.book),
                                  SizedBox(width: 8),
                                  Text('${teacher.major}'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.phone),
                                      SizedBox(width: 8),
                                      Text('${teacher.phno}'),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _makePhoneCall(teacher.phno);
                                    },
                                    child: const Text('Call'),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 8),
                                  Text('${teacher.address}'),
                                ],
                              ),
                            ],
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
    );
  }
}
