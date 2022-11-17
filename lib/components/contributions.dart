import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_task/model/provider.dart';
import '../size_config.dart';

class Contributions extends ConsumerWidget {
  Contributions({Key? key, required this.contributionsList}) : super(key: key);
  List<int> contributionsList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      //color: Colors.red,
      height: SizeConfig.blockSizeVertical! * 15,
      width: double.infinity,
      child: Center(
        child: GridView.count(
          // GridViewを中央寄せにする
          shrinkWrap: true,
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
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 1),
          children: [
            for (int i = 0; i < contributionsList.length; i++) ...[
              Container(
                decoration: BoxDecoration(
                  // ↓即時関数
                  color: (() {
                    if (contributionsList[i] == 1) {
                      return Colors.green[400];
                    } else {
                      return Colors.grey[300];
                    }
                  })(),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
