import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamRepositoryProvider = Provider<StreamRepo>((ref) => const StreamRepo());
class StreamRepo extends StatelessWidget {
  
  Stream<int> getStream() {
    return Stream.periodic(const Duration(seconds: 1), (i) =>i).take(30);
  }
  
  const StreamRepo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
