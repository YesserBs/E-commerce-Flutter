import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:get/get.dart';

final TextEditingController Controller1 = TextEditingController();
final TextEditingController Controller2 = TextEditingController();

TextFormField MyTextField(String text1, String text2, TextEditingController c){
  return
  TextFormField(
    controller: c,
    decoration: InputDecoration(
      labelText: text1,
      hintText: text2,
      border: OutlineInputBorder(),
    ),
    validator: (value){
      if (value == null || value.isEmpty){
        return "Remplis le champ";
      }
      return null;
    },
  );
}

class B extends StatefulWidget {
  const B({Key? key}) : super(key: key);

  @override
  State<B> createState() => _BState();
}

class _BState extends State<B> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  //borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Upper.png'), // Remplacez par le chemin de votre image
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text("",),
              ),
              ),

            ],
          ),
              Container(
              child: Icon(
              Icons.person,
              size: 150.0,
              color: Colors.blue[300],
              ),
              ),

          Container(
            margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  MyTextField("Nom utilisateur", "Mark", Controller1),
                  SizedBox(height: 15.0,),
                  MyTextField("Mot de passe", "******", Controller2),

                  SizedBox(
                    height: 15.0,
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[300], // Changer la couleur du bouton ici
                      ),
                      onPressed: (){
                      if (_formKey.currentState!.validate()){
                        String username = Controller1.text;
                        String pw = Controller2.text;
                        print("Name: $username | Password: $pw");
                      }
                      FocusScope.of(context).requestFocus(FocusNode());
                    }, child: Text("Enregistrer"),
                    ),
                  ),
                  SizedBox(height: 25.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Action à effectuer lors du tap sur le texte
                          print('Texte tapé !');

                        },

                        child: Text("-Tu as deja un compte?-",
                          style: TextStyle(
                              //fontSize: 5.0,
                          color: Colors.blue[300]),

                      ),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
