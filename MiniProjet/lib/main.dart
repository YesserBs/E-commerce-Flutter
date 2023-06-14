import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class TextController extends GetxController {
  // Create an observable string using RxString
  var message = ''.obs;
  var xInt = 0.obs;
  var xCh = ''.obs;
  var somme = 0.obs;

  // Function to update the message
  void updateMessage(String newMessage) {
    if (newMessage == ''){
      message.value = '';
      xCh.value = '';
      somme.value = 0;
    }
    else{
      message.value =  message.value + newMessage;
      xCh.value = xCh.value + newMessage;
    }
  }
  void updateX(String x) {
    if (xCh.value.length > 1) {
      String result = xCh.substring(0, xCh.value.length - 1);
      print(result);

      //xInt.value = int.tryParse(result.value) ?? 0;
      int? number = int.tryParse(result);
      somme.value = somme.value + number!;
      xCh.value = '';
      //print(somme);
    }
    if (x == "=")
      {
        print(somme);
        updateMessage(somme.value.toString());
      }
  }
}

class MyApp extends StatelessWidget {
  final TextController textController = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX String Observable',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX String Observable'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                textController.message.value,
                style: TextStyle(fontSize: 24),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      textController.updateMessage('1');
                    },
                    child: Text('1'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      textController.updateMessage('2');
                    },
                    child: Text('2'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      textController.updateMessage('3');
                    },
                    child: Text('3'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red),),
                    onPressed: () {
                      textController.updateMessage('');
                      textController.updateX('C');
                    },
                    child: Text('C'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      textController.updateMessage('4');
                    },
                    child: Text('4'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      textController.updateMessage('5');
                    },
                    child: Text('5'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      textController.updateMessage('6');
                    },
                    child: Text('6'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      textController.updateMessage('+');
                      textController.updateX('+');
                    },
                    child: Text('+'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      textController.updateMessage('7');
                    },
                    child: Text('7'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      textController.updateMessage('8');
                    },
                    child: Text('8'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      textController.updateMessage('9');
                    },
                    child: Text('9'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      textController.updateMessage('=');
                      textController.updateX('=');
                    },
                    child: Text('='),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}