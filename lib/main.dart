import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}


class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      title: "AppProva",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: ListPage(),
    );
   }
        
}
class ListPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: Text('Titolo di Merda'), ),
      body: Container
      (
        padding: EdgeInsets.all(16),
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [
            Container
            (
              margin: EdgeInsets.only(bottom: 25),
              child: Text("ACCEDI"),
            ),
            Container
            (
              margin: EdgeInsets.only(bottom: 25),
              child: Row
              (
                children: <Widget>
                [
                  Container
                  (
                    margin: EdgeInsets.only( right: 30),
                    child: Text("Username"),
                  ),
                  Flexible(child: TextField(),),
                ],
              )
            ),
            Container
            (
              margin: EdgeInsets.only(bottom: 25),
              child: Row
              (
                children: <Widget>
                [
                  Container
                  (
                    margin: EdgeInsets.only( right: 30),
                    child: Text("Password"),
                  ),
                  Flexible(child: TextField(obscureText: true,),),
                ],
              )
            ),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.end ,
              children: <Widget>
              [
                RaisedButton(child: Text("Login"), color: Colors.blue, onPressed: ()=>{},)
              ],
            ),
          ],
        )
      ),
    );
  }
}
      