import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Username extends StatefulWidget
{
  Username ({Key key}):super(key:key);
  _UserState user;
  @override
  State<StatefulWidget> createState() 
  {
    user = _UserState();
    return user;
  }

}
class _UserState extends State<Username>
{
  @override
  Widget build(BuildContext context) 
  {
    return( Container
    (
      padding: EdgeInsets.all(10),
      child: TextField
      (
        decoration: InputDecoration
        (
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),),
            labelText: "Username",
            suffixIcon: Icon(Icons.account_circle,),
        ),
      )
    ));
  }
}