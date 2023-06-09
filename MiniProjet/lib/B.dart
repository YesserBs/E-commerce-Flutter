import 'package:flutter/material.dart';

class B extends StatefulWidget {
  const B({Key? key}) : super(key: key);

  @override
  State<B> createState() => _BState();
}

class _BState extends State<B> {
  final _formKey = GlobalKey<FormState>();
  String? dropdownValue;

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
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: "n 1", child: Text("1")),
                  DropdownMenuItem(value: "n 2", child: Text("2")),
                  DropdownMenuItem(value: "n 3", child: Text("3")),
                ],
                value: dropdownValue,
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Select an option",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter something",
                  hintText: "idk man",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please fill in the field";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter something",
                  hintText: "idk man",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please fill in the field";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter something",
                  hintText: "idk man",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please fill in the field";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.0),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Hello world");
                    }
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
