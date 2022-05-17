import 'package:e_learning/Controllers/authentication_controller.dart';
import 'package:e_learning/Controllers/content_controller.dart';
import 'package:e_learning/Controllers/teacher_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationController());
    Get.lazyPut(() => ContentController());
    Get.lazyPut(() => TeacherController());
    // TODO: implement dependencies
  }

}