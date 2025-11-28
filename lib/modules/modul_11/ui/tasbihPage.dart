import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:praktikum_mobile_1/modules/modul_11/controller/c_tasbih_page.dart';

class Tasbihpage extends GetView<CTasbihPage> {
  const Tasbihpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 210, 145),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text('${controller.counter.value.round()}', style: TextStyle(fontSize: 250)),
              ),
              Obx(
                () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: LinearProgressIndicator(
                  value: controller.progress.value / 100,
                  backgroundColor: Colors.white54,
                  color: Colors.amberAccent.shade400,
                  minHeight: 15,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              ),
              const SizedBox(height: 75),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: InkWell(
                  onTap: controller.incrementCounter,
                  child: Container(decoration: const BoxDecoration(color: Colors.white), child: const Icon(Icons.fingerprint, size: 100))),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: controller.resetCounter, backgroundColor: Colors.white, child: Icon(Icons.refresh_outlined, color: Colors.black)),
    );
  }
}
