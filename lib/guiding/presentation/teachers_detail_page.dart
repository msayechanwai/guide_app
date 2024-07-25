import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/feat_core.dart';
import '../feat_guiding.dart';
import '../shared/teacher_providers.dart';

@RoutePage()
class TeacherDetailPage extends ConsumerStatefulWidget {
  const TeacherDetailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeacherDetailPageState();
}

class _TeacherDetailPageState extends ConsumerState<TeacherDetailPage> {
  int selectedIndex = 1;
  String searchQuery = '';

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

  // for phone call
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
        title: const Text("All Teachers List"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white54,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // Margin (left and right)
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                onChanged: (query) {
                  setState(() {
                    searchQuery = query;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Search by teacher name ...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.black38),
                ),
              ),
            ),
          ),
        ),
      ),

      body: Container(
        color: Colors.white54,
        child: listState.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          empty: () => const Center(child: Text("Empty Data")),
          noInternet: () => const Center(child: Text("No Internet")),
          success: (tList) {
            final filteredList = tList.where((teacher) {
              return teacher.teacherName.toLowerCase().contains(searchQuery.toLowerCase());
            }).toList();

            return ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final formattedDate = DateFormat('dd-MM-yyyy').format(filteredList[index].createdAt);
                return Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0), // Margin (left and right)
                  
                    child: Card(
                      color: Colors.white70,
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.account_box_rounded, color: Colors.blueGrey,),
                                const SizedBox(width: 8),
                                Text(filteredList[index].teacherName,
                                  style: const TextStyle(color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.school, color: Colors.blueGrey,),
                                const SizedBox(width: 8),
                                Text(filteredList[index].education,
                                  style: const TextStyle(color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.book, color: Colors.blueGrey,),
                                const SizedBox(width: 8),
                                Text(filteredList[index].major,
                                  style: const TextStyle(color: Colors.blueGrey,
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
                                    const Icon(Icons.phone, color: Colors.blueGrey,),
                                    const SizedBox(width: 8),
                                    Text(filteredList[index].phno,
                                      style:const TextStyle(color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 60,
                                  height: 35,
                                  child: TextButton(
                                    onPressed: () {
                                      _makePhoneCall(filteredList[index].phno);
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.blueGrey,
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
                                const Icon(Icons.location_on, color: Colors.blueGrey,),
                                const SizedBox(width: 8),
                                Text(filteredList[index].address,
                                  style: const TextStyle(color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.calendar_month, color: Colors.blueGrey,),
                                const SizedBox(width: 8),
                                Text(formattedDate,
                                  style: const TextStyle(color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
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
