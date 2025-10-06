
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

StateProvider<int> selectedColorProvider = StateProvider<int>((ref) {
  return 0;
});