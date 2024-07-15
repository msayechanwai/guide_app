import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../all_feat.dart';
import '../feat_guiding.dart';

@RoutePage()
class LoginUserUpdatePage extends ConsumerStatefulWidget {
  const LoginUserUpdatePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginUserUpdatePageState();
}

class _LoginUserUpdatePageState extends ConsumerState<LoginUserUpdatePage> {
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
    ref.listen(
      userListNotifierProvider,
      (previous, next) {
        next.when(
          initial: () => print("initial"),
          loading: () => print("loading"),
          empty: () => print("empty"),
          noInternet: () => print("noInternet"),
          success: (data) => print("success"),
          error: (error) => print("error"),
        );
      },
    );

    //delete notifier
    ref.listen(
      userDeleteNotifierProvider,
      (previous, state) {
        print("userDeleteNotifierProvider => $state");
        state.maybeWhen(
          orElse: () => print("userDeleteNotifierProvider orelse"),
          loading: () => print("userDeleteNotifierProvider loading"),
          success: (data) {
            getUserList();
          },
        );
      },
    );

    //add notifier
    ref.listen(
      userAddNotifierProvider,
      (previous, state) {
        state.maybeWhen(
            orElse: () {},
            success: (data) {
              //test
               showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Alert '),
                  content: const Text('User Add Succefully !'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Ok'),
                      onPressed: () {
                        //Navigator.of(context).pop();
                        context.router.back();
                      },
                    ),
                    
                  ],
                );
              },
            ); 
              //test
              print("AddItemSucceful => $data");
              getUserList();
            });
      },
    );

    //update notifier
    ref.listen(
      userUpdateNotifierProvider,
      (previous, state) {
        state.maybeWhen(
            orElse: () {},
            success: (data) {
              getUserList();
            });
      },
    );
    final listState = ref.watch(userListNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("User Edit Page")),
      body: listState.when(
        initial: () => const SizedBox(),
        loading: () => const Center(child: CircularProgressIndicator()),
        empty: () => const Center(child: Text("Empty Data")),
        noInternet: () => const Center(child: Text("noInternet")),
        success: (iList) {
          return ListView.builder(
            itemCount: iList.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID : ${iList[index].id}'),
                    Text('User Name: ${iList[index].username}'),
                    Text('Phone No.: ${iList[index].phno}'),
                    Text('Password: ${iList[index].password}'),
                    Text('address: ${iList[index].address}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                          context.router.push(
                          UserEditRoute(user: iList[index]),
                        );  
                        
                        ref
                            .read(userListNotifierProvider.notifier)
                            .getUserList();
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Confirm Delete"),
                              content: const Text(
                                  "Are you sure you want to delete this user?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                    ref
                                        .read(userDeleteNotifierProvider.notifier)
                                        .deleteUser(iList[index].id);
                                    ref
                                        .read(userListNotifierProvider.notifier)
                                        .getUserList();
                                  },
                                  child: const Text("Delete"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        error: (error) {
          return Center(
            child: TextButton(
              onPressed: () {
                ref.read(userListNotifierProvider.notifier).getUserList();
              },
              child: Text(error.toString()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: () => context.router.push(const ItemAddRoute()),
        onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Confirm Adding"),
                              content: const Text(
                                  "Are you sure you want to add new item?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: const Text("Add"),
                                ),
                              ],
                            );
                          },
                        );
                      },
        child: const Icon(Icons.add),
      ),
    );
  }
}
