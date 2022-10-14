import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/provider.dart';

class AddRoutine extends ConsumerWidget {
  const AddRoutine({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
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
                      const Text(
                        'STEP1',
                        style: TextStyle(fontWeight: FontWeight.bold),
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
                        padding: const EdgeInsets.only(top: 10),
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
              const Divider(
                color: Color.fromARGB(255, 223, 221, 221),
                thickness: 2,
                height: 30,
                //indent: 20,
                //endIndent: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
