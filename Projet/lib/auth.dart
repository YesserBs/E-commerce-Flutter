import 'package:get_storage/get_storage.dart';

String auth() {
  final box = GetStorage();
  final isAuthenticated = box.read('isAuthenticated') ?? false;

  if (isAuthenticated) {
    return '/';
  } else {
    return '/login';
  }
}
