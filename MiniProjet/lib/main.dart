import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String submittedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Submitted Text:', // Display a label for the submitted text
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              submittedText, // Display the submitted text
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Go to Page 2'), // Button to navigate to Page 2
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page2()),
                ).then((value) {
                  // When returning from Page 2, update the submitted text
                  if (value != null) {
                    setState(() {
                      submittedText = value;
                    });
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Enter Text'), // Text input field
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Submit'), // Button to submit the entered text
              onPressed: () {
                String submittedText = _textController.text;
                Navigator.pop(context, submittedText); // Return the text to Page 1
              },
            ),
          ],
        ),
      ),
    );
  }
}
