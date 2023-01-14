import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_task/size_config.dart';

class Detail extends ConsumerWidget {
  const Detail({super.key});

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
          '詳細',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('ルーティン名'),
                  TextField(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('継続日数'),
                  Text('10日継続中'),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('詳細'),
                  Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 1),
                    child: SizedBox(
                      height: 100,
                      width: 300,
                      child: TextFormField(
                        maxLines: null,
                        minLines: 3,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          labelText: '',
                          //この一行
                          alignLabelWithHint: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
