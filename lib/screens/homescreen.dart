import 'package:flutter/material.dart';
import 'package:notekeeper/screens/detailsscreen.dart';

class Notelist extends StatefulWidget {
  const Notelist({super.key});

  @override
  State<StatefulWidget> createState() {
    return NotelistState();
  }
}

class NotelistState extends State<Notelist> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: getNoteListview(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetails('Add Note');
        },
        tooltip: 'add note',
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListview() {
    TextStyle? titleStyle = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: const Text('dummy title'),
              subtitle: const Text('dummy Subtitle'),
              trailing: const Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                navigateToDetails('Edit Note');
              },
            ),
          );
        });
  }

  void navigateToDetails(String title) {
    Navigator.push(context, MaterialPageRoute(builder: ((context) {
      return Notedetails(title);
    })));
  }
}
