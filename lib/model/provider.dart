import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routineProvider = StateProvider((ref) => 1);

final routineNameController = StateProvider((ref) => TextEditingController());

final stepCount = StateProvider((ref) {
  return 1;
});

// testdata
StateProvider<List<int>> contributeMock = StateProvider((ref) {
  return [...List.filled(133, 0), 1, 0, 1, 0, 1, 0, 1];
});

// testdata
StateProvider<List<int>> contributeMock2 = StateProvider((ref) {
  return [...List.filled(133, 0), 1, 0, 1, 0, 1, 0, 1];
});
