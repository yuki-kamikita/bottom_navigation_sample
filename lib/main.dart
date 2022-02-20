import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:riverpod_sample_2/pages/Home.dart';
// import 'package:riverpod_sample_2/pages/Business.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'App Name';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: BottomNavigation(),
    );
  }
}

final navigationIndexProvider = StateProvider((ref) => 0);
class BottomNavigation extends HookConsumerWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  // final navigationList = <String, Icon>{
  //   'Home': const Icon(Icons.home),
  //   'Business': const Icon(Icons.business),
  //   'School': const Icon(Icons.school)
  // };
  //
  // final navigationWidget = <BottomNavigationBarItem>[]; // ここに追加するロジック組めない そのうちやり方見つかる気もするから放置

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(title: const Text('App Bar')),
      body:
      PageView(
        controller: controller,
        onPageChanged: (int index) {
          ref.read(navigationIndexProvider.state).state = index;
        },
        children: <Widget>[
          // const Center(child: Home(),),
          // const Center(child: Business(),),
          Center(child: Text('${ref.watch(navigationIndexProvider)}'),),
          Center(child: Text('${ref.watch(navigationIndexProvider)}'),),
          Center(child: Text('${ref.watch(navigationIndexProvider)}'),)
        ],
      ),
      // Center(
      //   child: Text('${ref.watch(navigationIndexProvider)}'),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        // items: navigationWidget,
        items: const <BottomNavigationBarItem>[

          // for (var i = 0; i < navigationItem.length; i++)
          //   BottomNavigationBarItem(
          //     label: navigationItem[i].key, // indexないのかよおぉ！！！
          //     icon: item.value
          //   ),

          // TODO: forとenumで回す 一旦無理そうなので保留
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: ref.read(navigationIndexProvider.state).state,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) => controller.animateToPage(index,
            duration: const Duration(milliseconds: 1000), curve: Curves.ease),
      ),
    );
  }
}
