import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_unguided/model/note_controller.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteController controller = Get.put(NoteController());

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Catatan')),
      body: Obx(() => ListView.builder(
            itemCount: controller.notes.length,
            itemBuilder: (context, index) {
              final note = controller.notes[index];
              return ListTile(
                title: Text(note['title'] ?? ''),
                subtitle: Text(note['description'] ?? ''),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => controller.deleteNote(index),
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add-note'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
