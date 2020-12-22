
import 'package:flutter_appfirebasetest/Screens/Login.dart';
import 'package:intl/intl.dart';


class Dashboard extends StatefulWidget{
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
   DateTime starttime  ;
   DateTime endtime ;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
        actions: <Widget>[
          FlatButton(onPressed: () async{
            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
           },
              child: Text("LOg out"))
        ],
      ),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              starttime !=null? Text('${DateFormat('yyyy-MM-dd – kk:mm').format(starttime)}') :Text("00"),
              endtime !=null?Text('${DateFormat('yyyy-MM-dd – kk:mm').format(endtime)}'):Text("00"),
            ],
          ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
             RaisedButton(
               onPressed: (){
               setState(() {
                starttime = DateTime.now() ;
               });
             },color: Colors.green,
               child: Text("start"),
             ),
             RaisedButton(
               onPressed: (){
                 setState(() {
                   endtime = DateTime.now() ;
                 });
               },color: Colors.red,
               child: Text("end"),
             ),
           ],
         ),

        ],),
      ),
    );
  }
}