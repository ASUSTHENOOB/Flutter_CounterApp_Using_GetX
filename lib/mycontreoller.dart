import 'package:get/get.dart';

class MyController extends GetxController {
  RxInt count = 0.obs;

  void incrementCounter() {
    count.value++;
  }

  void decrementCounter() {
    count.value--;
  }
}
