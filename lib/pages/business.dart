import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

/// Providerでグローバルに変数保存しておけばリセットされない
class Business extends ConsumerWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: Center(
        child: Text(ref.watch(counterProvider).toString()), // watchだと変更時に画面を更新
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.state).state++, // readだと更新しない
        // onPressed: () => ref.read(counterProvider.notifier).state++, // notifierとstateの違いがわからん
        child: const Icon(Icons.add),
      ),
    );
  }
}
