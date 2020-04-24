import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Password extends StatefulWidget
{
  Password({Key key}):super(key: key);
  _PasswordState a;
  @override
  _PasswordState createState() {
     a =  _PasswordState(); 
     return a;
  } 
  void ControllaPSW()=>a._controlloPassword();
}

class _PasswordState extends State<Password>
{
  bool _obscured = true;
  String _errore = "";
  bool a; 
  TextEditingController pswController = new TextEditingController();
  @override
  Widget build(BuildContext context) 
  {
    return Stack(
      children:<Widget>[
        if (_errore!="") Row(children: [Flexible(child:Container(padding: EdgeInsets.all(5),child:Text(_errore,  style: TextStyle(fontWeight : FontWeight.bold, color:Colors.red, decorationStyle: TextDecorationStyle.wavy)),),)]),
      Flexible(child:Container
          (
          padding: (_errore!="")?(EdgeInsets.fromLTRB(10,30,10,10)):EdgeInsets.all(10),
          child : Row
  
          (children: <Widget>
  
          [
  
            Flexible(child:TextField
  
            (
  
              controller: pswController,
  
              decoration: InputDecoration
  
              (
  
                border: OutlineInputBorder( 
  
                  borderRadius: BorderRadius.all(Radius.circular(10)),),
  
                  labelText: "Password",
  
              ),
  
              obscureText: _obscured,
  
              onChanged: (value) 
  
              {
  
                setState(() {
  
                  _errore="";
  
                });
  
              } ,
  
              
  
            )),
  
          IconButton
  
          (
  
            icon: _obscured? Icon(Icons.visibility_off): Icon(Icons.visibility),
  
            onPressed: () {
  
              setState(() {
  
              _obscured=!_obscured;
  
              });
  
            },
  
          ),
  
          ]), 
  
        ))    
      ]
    );
}
void _controlloPassword()
{
  if (controllaPsw(pswController.text)==false)
  {
    setState(() 
    {
      _errore="La password deve contenere 8 caratteri";
    });
  }
}

bool controllaPsw(String text) 
{
  if (text.length<8)
  {
    return false;
  }
  return true;
}

@override
void dispose()
  {
    pswController.dispose();
    super.dispose();
  }
}