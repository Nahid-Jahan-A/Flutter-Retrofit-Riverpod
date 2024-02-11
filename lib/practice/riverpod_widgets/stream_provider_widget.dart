import 'package:flutter/material.dart';
import 'package:flutter_retrofit/practice/riverpod_widgets/stream_provider_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamValueProvider = StreamProvider.autoDispose((ref) {
  final streamRepo = ref.watch(streamRepositoryProvider);
  return streamRepo.getStream();
});

class StreamProviderWidget extends ConsumerWidget {
  const StreamProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(streamValueProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Provider"),
      ),
      body: Center(
        child: stream.when(
          data: (data) {
            return Center(
              child: Text(
                data.toString(),
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 25,
                ),
              ),
            );
          },
          error: (error, stacktrace) => Text(
            error.toString(),
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
