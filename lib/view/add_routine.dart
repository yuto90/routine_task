import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_task/size_config.dart';
import '../model/provider.dart';
import '../components/step.dart';

class AddRoutine extends ConsumerWidget {
  const AddRoutine({super.key});

  // Top画面に戻る場合はstepCountをリセット
  Future<bool> _resetStepCount(WidgetRef ref) async {
    ref.read(stepCount.notifier).state = 1;
    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: WillPopScope(
        onWillPop: () => _resetStepCount(ref), // AppBarの戻るボタン押した時のイベント
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.blue), // バックボタンの色
            title: const Text(
              'ルーティンを登録',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < ref.watch(stepCount); i++) ...[
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.blockSizeHorizontal! * 2),
                              child: Column(
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Container(
                                    width: 4,
                                    height: 180,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'STEP ${i + 1}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 50,
                                  width: 200,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'やること',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical! * 1),
                                  child: SizedBox(
                                    height: 100,
                                    width: 300,
                                    child: TextFormField(
                                      maxLines: null,
                                      minLines: 3,
                                      //controller: _targetTextController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        filled: true,
                                        labelText: '詳細',
                                        //この一行
                                        alignLabelWithHint: true,
                                        //suffixIcon: IconButton(
                                        //icon: Icon(Icons.clear),
                                        //onPressed: () {
                                        //_targetTextController.clear();
                                        //},
                                        //),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Divider(
                          color: const Color.fromARGB(255, 223, 221, 221),
                          thickness: SizeConfig.blockSizeHorizontal! * 0.5,
                          height: SizeConfig.blockSizeHorizontal! * 5,
                          //indent: 20,
                          //endIndent: 20,
                        ),
                      ],
                    )
                  ],
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ref.read(stepCount.notifier).state++;
              //ref.read(stepCount.notifier).update((state) => state + 1);
            },
            child: const Icon(Icons.library_add_rounded),
          ),
        ),
      ),
    );
  }
}
