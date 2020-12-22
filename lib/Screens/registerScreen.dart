import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_appfirebasetest/Screens/dashboard.dart';

class RegisterScreen extends StatefulWidget{
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void initState()
  {
    super.initState();
  }


  final _formkey = GlobalKey<FormState>();

  TextEditingController _namecontroller = TextEditingController();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  TextEditingController _countrycontroller = TextEditingController();


  @override
  void dispose()
  {
    _namecontroller.dispose();

    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    _countrycontroller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Register New Account'),
      ),
      body: ListView(
          children: <Widget>[ Container(
          padding: EdgeInsets.all(16),
          child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _namecontroller,
                    decoration: InputDecoration(
                      hintText: 'name',
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please Fill name Input';
                      }
                      // return 'Valid Name';
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please Fill Email Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please Fill Password Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _countrycontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please Fill Country Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text('Register New Account',style: TextStyle(color: Colors.white),),
                    onPressed: () async{
                      if(_formkey.currentState.validate()){
                        var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);

                        if(result != null)
                        {
                          // var userInfo = Firestore.instance.collection('users').document().setData({
                          //   'email':result.email
                          // });
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Dashboard()),
                          );
                        }else{
                          print('please try later');
                        }
                      }
                    },
                  )
                ],
              )
          ),
        ),
      ]),
    );
  }

}