import 'package:first_app/password.dart';
import 'package:first_app/username.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class ListPage extends StatefulWidget
{
  ListPage({Key key}):super(key: key);
  @override
  _ListPageStage createState() => _ListPageStage();
}
  


class _ListPageStage extends State<ListPage>
{ 
  final String title = "Titolo Di Merda";
  final DateFormat formatoData = DateFormat("dd/mm/yyyy");
  var _selectedIcon = 0;
  void _onTapped(index)
  {
      setState(() {
        _selectedIcon= index;
  });
  }
  @override
  Widget build(BuildContext context) 
  {
    int width = MediaQuery.of(context).size.width.toInt();
    int height = MediaQuery.of(context).size.height.toInt();
    double devicePizelRatio = MediaQuery.of(context).devicePixelRatio;
    String aspectRatio = MediaQuery.of(context).size.aspectRatio.toStringAsFixed(4);
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold
    (
      appBar: AppBar(title: Text(title),),
      body: new Stack(
        children:<Widget>[
           new Container(
          decoration: new BoxDecoration(
            //image: new DecorationImage(image: new AssetImage("img/concert.jpg"), fit: BoxFit.cover,),
          ),
        ),
        //(_selectedIcon==0)?new _Login():new _Registration(),
        Padding(
          padding: EdgeInsets.all(8),
          child:DecoratedBox(
            decoration: BoxDecoration(border:Border.all(width: 1),
            borderRadius: BorderRadius.all(Radius.circular(6))),
            child:Padding(padding:EdgeInsets.all(8), child:Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                     children: <Widget>[
                       Text("Width:"),
                       Text("Height"),
                     ] 
                    ),
                    Column(
                     children: <Widget>[
                       Text(width.toString()),
                       Text(height.toString()),
                     ]
                    ),
                    Column(
                     children: <Widget>[
                       Text("PR:"),
                       Text("AR"),
                     ] 
                    ),
                    Column(
                     children: <Widget>[
                       Text(devicePizelRatio.toString()),
                       Text(aspectRatio),
                     ]
                    ),
                  ]
                ),
                Text(orientation.toString()),
              ],
            )))),
        ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIcon,
        onTap: _onTapped, 
        items: const <BottomNavigationBarItem>
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text("Login"),
            

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            title: Text("Registrati"),
          ),
        ]
        ) ,
    );
  }
}

class _Login extends StatefulWidget
{
  _Login({Key key}):super(key: key);
  @override
  _LoginState createState() => _LoginState();
}
  
class _LoginState extends  State<_Login>
{
  Password psField  = Password();
  Username user = Username();
  @override
  Widget build(BuildContext context) 
  {return Column(
    children: <Widget>
      [
        Container
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
              //child: Text("ACCEDI"),
            ),
            user,
            psField,
            Row
            (
              mainAxisAlignment: MainAxisAlignment.end ,
              children: <Widget>
              [
                RaisedButton(child: Text("Login"), color: Colors.blue, onPressed: (){},)
              ],
            ),
          ],
        ),
      ),
    ]
    );
  }
}

class _Registration extends StatefulWidget
{
  _Registration({Key key}):super(key: key);
  @override
  _RegistrationState createState() => _RegistrationState();
}
  
class _RegistrationState extends  State<_Registration>
{
  DateTime _selectedDate;
  final DateFormat _formatoData = DateFormat("dd/MM/yyyy");
  Password psField  = Password();
  Username user = Username();

  Future<void> getData(BuildContext context)
  async {
    var fDate= await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2015), lastDate: DateTime(2030));
    setState(() {
      if (fDate!=null)
      {_selectedDate=fDate;}
    });
  } 


  @override
  Widget build(BuildContext context) 
  {
        return Column( 
        children: <Widget>
          [
          Container
          (
            padding: EdgeInsets.all(16),
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>
              [
                Container
                (
                  child: Text("Registrati"),
                ),
                user,
                psField,
                Container(padding: EdgeInsets.all(10),
                child: Row
                (children: <Widget>
                [
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(right: 156),
                  alignment: Alignment.centerLeft,
                  child:Text((_selectedDate!=null)?_formatoData.format(_selectedDate):"Data di nascita", textAlign: TextAlign.left, style: TextStyle(fontSize: 15),),
                  decoration: BoxDecoration(
                    border: Border.all(color:Colors.grey, width:1,),
                    borderRadius: BorderRadius.circular(10),
                  )),
                IconButton
                (
                  icon:Icon(Icons.calendar_today),
                  onPressed: ()=>getData(context),
                  color: Colors.blue[700],
                )
              ]),),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.end ,
              children: <Widget>
              [
                RaisedButton(child: Text("Login"), color: Colors.blue, onPressed: ()
                {
                 psField.ControllaPSW();
                 setState(() {
                   
                 });
                }
                )
              ],
            ),
          ],
        ),
      ),
      ]
    );
  }
}



class utente
{
  String _username;
  String _password;

  utente(this._username, this._password);

  String controllaUser(String usrname)
  {
    usrname.replaceAll("@", "");
    usrname.replaceAll(" ", "");
    return usrname;
  }
}