import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/feat_core.dart';
import '../feat_guiding.dart';

@RoutePage()
class UserDetailPage extends ConsumerStatefulWidget {
  const UserDetailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends ConsumerState<UserDetailPage> {
  int selectedIndex = 1;
  String searchQuery = '';

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
   // final teacher = ref.watch(currentTeacherProvider);
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
        title: const Text("All User List"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
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
                  hintText: 'Search by username...',
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
        color: Colors.white,
        child: listState.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          empty: () => const Center(child: Text("Empty Data")),
          noInternet: () => const Center(child: Text("No Internet")),
          success: (uList) {
            final filteredList = uList.where((user) {
              return user.username.toLowerCase().contains(searchQuery.toLowerCase());
            }).toList();

            return ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final user = filteredList[index];
                final formattedDate = DateFormat('dd-MM-yyyy').format(user.createdat);
                return Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Card(
                      color: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Top Section
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: AssetImage('assets/images/welcome.jpg'),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(width: 8),
                                          Text(
                                            user.username,
                                            style: const TextStyle(
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(), // Dividing line
                            // Bottom Section
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        'Phone',
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                           user.phno,
                                            style: const TextStyle(
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 60,
                                            height: 35,
                                            child: TextButton(
                                              onPressed: () {
                                                _makePhoneCall(user.phno);
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
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4), // Reduced height for spacing
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        'Address',
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        user.address,
                                        style: const TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4), // Reduced height for spacing
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        'Created At',
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        formattedDate,
                                        style: const TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
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
        selectedItemColor: Colors.blue,
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
