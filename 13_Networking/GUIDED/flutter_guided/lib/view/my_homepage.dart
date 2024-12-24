import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_guided/view_model/counter_controller.dart';

class MyHomepage extends StatelessWidget {
  MyHomepage({super.key, required this.title});

  final String title;

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Praktikum 13",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Seberapa Keras Kau",
                style: TextStyle(fontSize: 24),
              ),
              Text(
                "Pukulan: ${controller.counter.value}",
                style: const TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                  onPressed: () => getsnack(), child: Text('SnackBar')),
              ElevatedButton(
                  onPressed: () => getbottomsheet(),
                  child: Text('Bottom Sheet')),
            ],
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.incrementController();
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.amber,
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              controller.resetController();
            },
            child: const Icon(Icons.refresh),
            backgroundColor: Colors.amber,
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              controller.decrementController();
            },
            child: const Icon(Icons.minimize),
            backgroundColor: Colors.amber,
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              Get.toNamed('/detail');
            },
            child: const Icon(Icons.details),
            backgroundColor: Colors.amber,
          ),
        ],
      ),
    );
  }

  void getsnack() {
    Get.snackbar(
      "SnackBar",
      "Ini SnackBar",
      backgroundColor: Colors.amber,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void getbottomsheet() {
    Get.bottomSheet(
      Container(
        height: 200,
        color: Colors.amber,
        child: const Center(
          child: Text(
            'Ini adalah getX BottomSheet',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
