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
          return Column(
            children: [
              ListTile(
                  leading: const Icon(Icons.face),
                  title: Text('$index'),
                  subtitle: const Text('ルーティン'),
                  trailing: Text('$index日継続中')),
              // todo ルーティン毎に草生やせるようにする
              Container(
                //color: Colors.red,
                height: SizeConfig.blockSizeVertical! * 15,
                width: double.infinity,
                child: GridView.count(
                  // GridViewをスクロールさせない
                  physics: const NeverScrollableScrollPhysics(),
                  // 横へWidgetを出す
                  scrollDirection: Axis.horizontal,
                  // 1行あたりに表示するWidgetの数
                  crossAxisCount: 7,
                  // Widget間のスペース（上下）
                  mainAxisSpacing: 4,
                  // Widget間のスペース（左右）
                  crossAxisSpacing: 4,
                  // 全体の余白
                  padding: const EdgeInsets.all(4),
                  children: [
                    for (int i = 0; i < 140; i++) ...[
                      Container(
                        decoration: BoxDecoration(
                          color: ref.read(contributeMock.notifier).state[i] == 1
                              ? Colors.green[400]
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ],
                ),
              )
            ],
          ); // todo
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
