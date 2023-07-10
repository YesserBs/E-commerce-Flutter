import 'package:get_storage/get_storage.dart';
import 'package:myproj/routes/app_routes.dart';

String auth() {
  final box = GetStorage();
  final isAuthenticated = box.read('isAuthenticated') ?? false;
  print("$isAuthenticated");
  if (isAuthenticated) {
    return AppRoutes.DASHBOARD;
  } else{
    return AppRoutes.LOGIN;
  }
}
