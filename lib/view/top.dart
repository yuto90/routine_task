import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/provider.dart';
import 'add_routine.dart';

class Top extends ConsumerWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'ルーティン一覧',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(36.0),
        shrinkWrap: true,
        itemCount: ref.read(routineProvider.notifier).state,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.face),
            title: Text('$index'),
            subtitle: const Text('ルーティン'),
            trailing: const Icon(Icons.more_vert),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push<void>(
              MaterialPageRoute(builder: (context) => const AddRoutine()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
