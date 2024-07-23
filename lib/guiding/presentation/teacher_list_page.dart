import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    ref.read(teacherListNotifierProvider.notifier).getTeacherList();
  }

  @override
  Widget build(BuildContext context) {
    final teacherListState = ref.watch(teacherlistProvider);
    print("teacherListState => $teacherListState");
    final filteredTeachers = teacherListState.where((teacher) => teacher.major == widget.major).toList();
    print("filteredTeachers => $filteredTeachers");
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.major} Teachers'),
      ),
      body: teacherListState.isEmpty
          ? Center(child: Text('Empty'))
          : ListView.builder(
              itemCount: filteredTeachers.length,
              itemBuilder: (context, index) {
                final teacher = filteredTeachers[index];
                return ListTile(
                  title: Text(teacher.teacherName),
                  subtitle: Text(teacher.education),
                );
              },
            ),
    );
  }
}
