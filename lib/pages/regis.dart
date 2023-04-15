import 'package:flutter/material.dart';
import 'package:pbm1/pages/login.dart';

class Regis extends StatefulWidget {
  
  // String usn;
  // String email;
  // String pw;

  // Regis({required this.usn, required this.email, required this.pw});

  @override
  State<Regis> createState() => _RegisState();
}

class _RegisState extends State<Regis> {

  TextEditingController email = new TextEditingController();
  TextEditingController pw = new TextEditingController();
  TextEditingController usn = new TextEditingController();

  //final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    void main (){
      runApp(MaterialApp(
        initialRoute: '/',
        routes: {
        '/login' : (context) => Login()
    }
      ));
    }
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Sign Up"),
        backgroundColor: Color.fromARGB(255, 82, 164, 232),
      ),
      body: Container(
        padding: new EdgeInsets.all(10),
        child: ListView(
          children:<Widget>[
            Image(
              image: NetworkImage('https://i.pinimg.com/564x/0f/a0/02/0fa002a2aa800e88a798017cf974a83a.jpg'),
              width: 230,
              height: 230,
              ),
            Text(
              "Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Padding(padding: new EdgeInsets.only(bottom: 20)),
            TextFormField(
              controller: usn,
              decoration: InputDecoration(
                hintText: "Masukkan username",
                labelText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color.fromARGB(255, 82, 164, 232))
                ),
              ),
              validator: (value){
                if (value!.isEmpty){return 'This file is required';}return null;
              },
            ),
            Padding(padding: new EdgeInsets.only(top: 20)),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Masukkan email",
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color.fromARGB(255, 82, 164, 232))
                ),
              ),
              validator: (value){
                if (value!.isEmpty){return 'This file is required';}return null;
              },
            ),
            Padding(padding: new EdgeInsets.only(top: 20)),
            TextFormField(
              controller: pw,
              decoration: InputDecoration(
                hintText: "Masukkan password",
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(20)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color.fromARGB(255, 82, 164, 232))
                ),),
                
              validator: (value){
                if (value!.isEmpty){return 'This file is required';}return null;
              },
            ),
            Padding(padding: new EdgeInsets.only(top: 20)),

            //TOMBOL SUBMIT
            ElevatedButton(
              child: Text("submit"),
              onPressed: (){
                if (usn.text.isEmpty || email.text.isEmpty || pw.text.isEmpty){
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
                } else{
                  final Map<String, dynamic> regis = {
                    'usn' : usn.text,
                    'email': email.text,
                    'pw': pw.text
                  };
                  Navigator.pushNamed(
                  context, '/login', arguments: regis);
                }
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 124, 191, 246)
              ),
            ),
            TextButton(
              child: Text("Have an account? Login here",
                style: TextStyle(
                  color: Color.fromARGB(255, 124, 191, 246),
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromARGB(85, 0, 0, 0)
                  ),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Login()));
              },
            ),
          ]
        )
      ));
  }
}


// class Regis extends StatelessWidget {

  // TextEditingController _email = new TextEditingController();
  // TextEditingController _pw = new TextEditingController();
  // TextEditingController _usn = new TextEditingController();


//   // This widget is the root of your application.

//             // ElevatedButton(
//             //   child: Text("login"),
//             //   onPressed: (){
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(builder: (context)=> Login(email: _email.text, pw: _pw.text))
//             //     );
//             //   }, 
//             // )
//           ],
//           ),
//       ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     Navigator.of(context).push(
      //       MaterialPageRoute(builder: (context){
      //         return Page2();
      //       }, ));
      //     },
      //   child: Icon(Icons.keyboard_arrow_right),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

//     );}
// }  