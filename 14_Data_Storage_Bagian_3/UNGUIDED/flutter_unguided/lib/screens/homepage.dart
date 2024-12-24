import 'package:flutter/material.dart';
import 'package:flutter_guided/services/api_services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final ApiController controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Operations with GetX'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan data atau loading
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.posts.isEmpty) {
                return const Center(
                  child: Text(
                    "Tekan tombol GET untuk mengambil data",
                    style: TextStyle(fontSize: 12),
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: controller.posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          title: Text(
                            controller.posts[index]['title'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          subtitle: Text(
                            controller.posts[index]['body'],
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),

            // Tombol untuk operasi CRUD
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                onPressed: controller.fetchPosts,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text('GET', style: TextStyle(fontSize: 16)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                onPressed: controller.createPost,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('POST', style: TextStyle(fontSize: 16)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                onPressed: controller.updatePost,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('UPDATE', style: TextStyle(fontSize: 16)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                onPressed: controller.deletePost,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('DELETE', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
