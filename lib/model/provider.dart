import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routineProvider = StateProvider((ref) => 5);

final routineNameController = StateProvider((ref) => TextEditingController());

final stepCount = StateProvider((ref) {
  return 1;
});
