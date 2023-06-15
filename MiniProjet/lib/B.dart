import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.dart'; // Nécessaire pour accéder à Controller dans main

class B extends StatelessWidget {
  const B({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyController myController = Get.find<MyController>();
    final TextEditingController textFieldController = TextEditingController();

    void handleButtonPress() {
      final String inputValue = textFieldController.text;
      print('Input Value: $inputValue');
    }

    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
            child:
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                      child:
                      Form(child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50.0,),
                          TextField(
                        controller: textFieldController,
                        decoration: InputDecoration(
                          labelText: "Saisie",
                          hintText: "article",
                          border: OutlineInputBorder(),
                        ),
                      ),
                        //SizedBox(height: 10.0),
                        SizedBox(width: double.infinity,
                          child:
                          ElevatedButton(
                            onPressed:  () => myController.test(textFieldController.text),
                            child: Text('print'),
                          ),
                        ),
                        ]

                      ),
                      ),

                    ),
                  ],
                ),
          ),
        ),
      );
  }
}
