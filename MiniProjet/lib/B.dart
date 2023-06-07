import 'package:flutter/material.dart';

class B extends StatelessWidget {
  const B({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(" ",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              ),

              Expanded(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
                margin: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(" ",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),),
            ],
          ),

          SizedBox(height: 200.0,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 60.0),
            margin: EdgeInsets.fromLTRB(10.0, 50.0, 100.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(" ",
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),



        ],
      ),
    );
  }
}