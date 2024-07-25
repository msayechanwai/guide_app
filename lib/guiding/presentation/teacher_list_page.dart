import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../shared/teacher_providers.dart';

@RoutePage()
class TeacherListPage extends ConsumerStatefulWidget {
  final String major;

  const TeacherListPage({super.key, required this.major});

  @override
  ConsumerState<TeacherListPage> createState() => _TeacherListPageState();
}

class _TeacherListPageState extends ConsumerState<TeacherListPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
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
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search by Teacher Name',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Expanded(
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
                  final filteredTeachers = teachers
                      .where((teacher) =>
                          teacher.major == widget.major &&
                          teacher.teacherName
                              .toLowerCase()
                              .contains(_searchText.toLowerCase()))
                      .toList();
                  return filteredTeachers.isEmpty
                      ? const Center(child: Text('No teachers found for the selected major'))
                      : ListView.builder(
                          itemCount: filteredTeachers.length,
                          itemBuilder: (context, index) {
                            final teacher = filteredTeachers[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Card(
                                color: Colors.white60,
                                child: ListTile(
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.account_box_rounded, color: Colors.blueAccent,),
                                          const SizedBox(width: 8),
                                          Text('${teacher.teacherName}',
                                            style: TextStyle(color: Colors.blueAccent,
                                                    fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.school, color: Colors.blueAccent,),
                                          const SizedBox(width: 8),
                                          Text('${teacher.education}',
                                            style: TextStyle(color: Colors.blueAccent,
                                                    fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.book,color: Colors.blueAccent,),
                                          const SizedBox(width: 8),
                                          Text('${teacher.major}',
                                            style: TextStyle(color: Colors.blueAccent,
                                                    fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.phone, color: Colors.blueAccent,),
                                              const SizedBox(width: 8),
                                              Text('${teacher.phno}',
                                                style: TextStyle(color: Colors.blueAccent,
                                                    fontWeight: FontWeight.bold,
                                            ),
                                              ),
                                            ],
                                          ),
                                         SizedBox(
                                            width: 70,
                                            height: 40,
                                            child: TextButton(
                                              onPressed: () {
                                                _makePhoneCall(teacher.phno);
                                              },
                                              style: TextButton.styleFrom(
                                                backgroundColor: Colors.blueAccent, 
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8.0), // round corners
                                                ),
                                              ),
                                              child: const Text(
                                                'Call',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on,color: Colors.blueAccent,),
                                          const SizedBox(width: 8),
                                          Text('${teacher.address}',
                                            style: TextStyle(color: Colors.blueAccent,
                                                    fontWeight: FontWeight.bold,
                                            ),
                                          ),
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
          ],
        ),
      ),
    );
  }
}
