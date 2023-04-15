import 'package:flutter/material.dart';
import 'package:pbm1/pages/homePage.dart';
import 'package:pbm1/pages/regis.dart';


class Login extends StatefulWidget {

  // final String email;
  // final String pw;
  
  // Login({required this.email, required this.pw});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _email = new TextEditingController();
  TextEditingController _pw = new TextEditingController();
  TextEditingController _usn = new TextEditingController();

  //final formKey = GlobalKey<FormState>();

  // @override
  // void initState(){
  //   super.initState();
  //   _email.text = widget.email;
  //   _pw.text = widget.pw;
  // }
static const String routeName = "/login";
  @override
  Widget build(BuildContext context) {

    Map<String, dynamic>? regis =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var usn = regis?['usn'];
    var email = regis?['email'];
    var pw = regis?['pw'];
    

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Login"),
        backgroundColor: Color.fromARGB(255, 82, 164, 232),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children:<Widget>[
            Image(
              image: NetworkImage('https://i.pinimg.com/564x/f6/1b/18/f61b18283382928d794a9129881525cc.jpg'),
              width: 230,
              height: 230,
            ),
            Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            new Padding(padding: new EdgeInsets.only(bottom: 20)),

            // Form Email
            TextField(
              controller: _email,
              decoration: InputDecoration(
                hintText: "Masukkan email",
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color.fromARGB(255, 82, 164, 232))
                ),
              ),
            ),
            Padding(padding: new EdgeInsets.only(top: 20)),

            // Form Password
            TextField(
              controller: _pw,
              decoration: InputDecoration(
                hintText: "Masukkan password",
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color.fromARGB(255, 82, 164, 232))
                ),),
            ),
            Padding(padding: new EdgeInsets.only(top: 10)),
            //Forgot Password
            Container(
              alignment: Alignment.bottomRight,
              child: Text("Forgot Password?  ",
              style: TextStyle(color: Colors.black),),
            ),
            Padding(padding: new EdgeInsets.only(top: 8)),

            //Tombol Button
            ElevatedButton(
              child: Text("login"),
              onPressed: (){
                if (_email.text.isEmpty || _pw.text.isEmpty){
                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text('Konfirmasi Registrasi'),
                        content: Text('Please fill all of the required'),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child: Text('Ok'))
                        ],
                      );
                    }
                  );
                }
                else if(_email.text != email && _pw.text != pw){
                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text('Konfirmasi Login'),
                        content: Text('Email or Password is wrong'),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child: Text('Ok'))
                        ],
                      );
                    });
                }
                else{ 
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> homePage())
                  );
                }
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 124, 191, 246)
              ),
            
                  // if (_email.text == value && _pw.text == pw){
                  //   Navigator.push(context, 
                  //   MaterialPageRoute(
                  //     builder: (context) => homePage(usn: _usn.text, email: _email.text, pw: _pw.text)));
                  // }else{
                    // showDialog(
                    // context: context,
                    // builder: (context){
                    //   return AlertDialog(
                    //     title: Text('Konfirmasi Login'),
                    //     content: Text('Email or Password is wrong'),
                    //     actions: [
                    //       TextButton(onPressed: (){
                    //         Navigator.of(context).pop();
                    //       }, child: Text('Ok'))
                    //     ],
                    //   );
                  //   });
                  // }
            ),

            TextButton(
              child: Text("Dont have an account? Regis here",
                style: TextStyle(
                  color: Color.fromARGB(255, 124, 191, 246),
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromARGB(85, 0, 0, 0)
                  ),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Regis()));
              },
              ),
              
          ],
        ),
      ),
    );}
}  



// class Login extends StatelessWidget {




//   // This widget is the root of your application.
