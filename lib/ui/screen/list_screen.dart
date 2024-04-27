import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:uplash_task/get_it.dart';
import 'package:uplash_task/store/list_store.dart';
import '../widgets/list_card.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    final store = getIt.get<ListStore>();
    store.fetchAllPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = getIt.get<ListStore>();

    return Observer(builder: (context) {
      final theme = Theme.of(context);
      final future = store.data.value;

      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            titleTextStyle: theme.primaryTextTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            title: Text(future?.value?.entries.elementAt(2).value ?? ''),
          ),
          body: (future == null || future.status == FutureStatus.pending)
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    final entry = store.data.value?.value?.entries;
                    return ListCard(
                        title: entry?.elementAt(0).value ?? '-',
                        description: entry?.elementAt(1).value ?? '-');
                  },
                ),
        ),
      );
    });
  }
}
