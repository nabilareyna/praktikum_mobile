import 'package:get/get.dart';

class CTasbihPage extends GetxController {
  var counter = 0.obs;
  var progress = 0.0.obs;
  final double countMax = 33;

  void incrementCounter() {
    if (counter.value < countMax) {
      counter.value++;
      progress.value = (counter.value / countMax)*100;
    }
  }

  void resetCounter() {
    counter.value = 0;
    progress.value = 0.0;
  }
}
