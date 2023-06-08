import 'package:flutter/material.dart';

class B extends StatefulWidget {
  const B({Key? key}) : super(key: key);

  @override
  State<B> createState() => _BState();
}

class _BState extends State<B> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter smth",
                  hintText: "idk man",
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if (value == null || value.isEmpty){
                    return "Remplis le champ";
                  }
                  return null;
                },
              ),

              SizedBox(
                height: 15.0,
              ),

              SizedBox(
                width: double.infinity,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    if (_formKey.currentState!.validate()){
                      print("Hello world");
                    }
                    FocusScope.of(context).requestFocus(FocusNode());
                  }, child: Text("Enregistrer"),
                  ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
