import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_task/size_config.dart';
import '../model/provider.dart';
import 'add_routine.dart';

class Top extends ConsumerWidget {
  const Top({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Widgetサイズ最適化用クラスを初期化
    SizeConfig().init(context);

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
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 5),
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
