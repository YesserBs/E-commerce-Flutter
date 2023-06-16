import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.dart'; // Nécessaire pour accéder à Controller dans main
import 'package:flutter_svg/flutter_svg.dart';

class B extends StatelessWidget {
  const B({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyController myController = Get.find<MyController>();
    final TextEditingController textFieldController = TextEditingController();
    final TextEditingController textFieldController2 = TextEditingController();


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child:
          Column(
            children: [

              Row(
                children: [
                  Expanded(child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      //borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/Upper.png'), // Remplacez par le chemin de votre image
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(" ",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  ),

                ],
              ),

              Container(
                margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                child:
                Form(child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 15.0,),
                      TextFormField(
                        controller: textFieldController,
                        decoration: InputDecoration(
                          labelText: "Nom Utilisateur",
                          //hintText: "article",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        controller: textFieldController2,
                        decoration: InputDecoration(
                          labelText: "Mot de passe",
                          //hintText: "article",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      //SizedBox(height: 10.0),
                      SizedBox(height: 10.0,),
                      SizedBox(width: double.infinity,
                        child:
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[300], // Changer la couleur du bouton ici
                          ),
                          onPressed:  () => myController.test(textFieldController.text, textFieldController2.text),
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