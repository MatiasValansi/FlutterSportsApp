
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

StateProvider<int> selectedColor = StateProvider<int>((ref) {
  return 0;
});