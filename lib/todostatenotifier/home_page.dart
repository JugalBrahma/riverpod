import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider_riverpod_with_copywith/todostatenotifier/todoprovider.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController task = TextEditingController();
    final noItems = ref.watch(todoprovider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: noItems.length,
              itemBuilder: (context, index) {
                final items = noItems[index].name;
                final id = noItems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.lightBlue[50],
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.lightBlue, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text('$items'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          //update
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  title: const Text('Update your task'),
                                  actions: [
                                    TextField(
                                      controller: task..text = items,
                                      decoration: InputDecoration(
                                        hintText: 'Update your task',
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        ref
                                            .read(todoprovider.notifier)
                                            .updateItems(id.id, task.text);
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Update'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            ref.read(todoprovider.notifier).deletItem(id.id);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                title: Text('Add you task'),
                actions: [
                  TextField(
                    controller: task,
                    decoration: InputDecoration(
                      hintText: 'Enter your task',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(todoprovider.notifier).addItem(task.text);
                      Navigator.pop(context);
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
