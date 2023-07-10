import 'package:get_storage/get_storage.dart';

class DataRepository {
  final box = GetStorage();

  String getData() {
    return box.read('key') ?? ''; // Read data from GetStorage
  }

  void setData(String data) {
    box.write('key', data); // Write data to GetStorage
  }
}
