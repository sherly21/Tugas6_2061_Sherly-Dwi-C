import 'package:flutter/material.dart';
import 'package:pbm1/pages/login.dart';


class homePage extends StatefulWidget {


  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  TextEditingController berat = new TextEditingController();
  TextEditingController tinggi = new TextEditingController();

  double? result;

  void hitungBMI(){
    double weight = double.parse(berat.text);
    double height = double.parse(tinggi.text);
    double bmi = weight/(height*height);
    result = bmi;

    setState(() => {
      if (result !< 18.5) {
        Text('Underweight')
      } else if (result !>= 18.5 && result !< 24.9) {
        Text('Normal')
      } else if (result !>= 25 && result !< 29.9) {
        Text('Overweight')
      } else {
        Text('Obese')
       }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Map<String, dynamic>? regis =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var email = regis?['email'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 82, 164, 232),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text('BMI',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,),
            ),
            Text('Welcome $email',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,),
            ),
            SizedBox(height: 20),
            // PENGHITUNG BMI
            TextField(
              controller: berat,
              decoration: InputDecoration(
                labelText: 'Input Your Weight (in Kg)',
                prefixIcon: Icon(Icons.line_weight)
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tinggi,
              decoration: InputDecoration(
                labelText: 'Input Your Height (in Cm)',
                prefixIcon: Icon(Icons.height)
              ),
              keyboardType: TextInputType.number,
            ),


            SizedBox(height: 16,),
            //Button
            ElevatedButton(onPressed: (){
              if (berat.text.isEmpty || tinggi.text.isEmpty){
                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text('BMI Confirm'),
                        content: Text('Please fill all of the required'),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child: Text('Ok'))
                        ],
                      );
                    }
                  );
                }else{
                  setState(() {
                    hitungBMI();
                  });
                  
                }
            }, 
            child: Text('Calculate')),

            TextButton(
              child: Text("Logout here",
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

          
          ],
        )
      ),
    );}

    }


