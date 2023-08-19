import 'package:flutter/material.dart';

class MyCell extends StatefulWidget {
  const MyCell({Key? key}) : super(key: key);

  @override
  State<MyCell> createState() => _MyCellState();
}

class _MyCellState extends State<MyCell> {

  double celsius = 0.0;
  double fahrenheit = 32.0;
  void convertTemperature(){
    setState(() {
      fahrenheit = celsius * 9 / 5 + 32;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text("Tempereture Changer",style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.blue
        ),)
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/1.jpg'), // Replace with your image asset path
                fit: BoxFit.cover, // Adjust the fitting of the image
              ),
            ),
          ),
          Container(
            margin:EdgeInsets.only(left: 20,right: 20,top: 50),
            width: 380,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffA10100), Color(0xffFFF75D),],),
              boxShadow:[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 20,
                  blurRadius: 10,
                  offset: Offset(0, 8),// changes the position of the shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Text("Celsius to Farenheit",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                ),),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.black),
                      fillColor: Colors.grey,
                      labelText: 'Celsius',
                      border: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.black,width: 10)
                      )
                      ),
                    style: TextStyle(fontSize: 25.0),
                  onChanged: (value) {
                    setState(() {
                      celsius = double.tryParse(value) ?? 0.0;
                    });
                  },
                    ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),

                  ),
                  height: 60,
                  width: double.infinity,
                  child: Text(
                    'Fahrenheit: $fahrenheit',
                    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.orangeAccent; // Background color when pressed
                      }
                      return Colors.red; // Default background color
                    },
                  ),
                ),
                  onPressed: convertTemperature,
                  child: Text('Convert'),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(

                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.redAccent; // Background color when pressed
                          }
                          return Colors.grey; // Default background color
                        },
                      ),
                    ),
                    onPressed: (){
                     Navigator.pushNamed(context, "farrenframe");
                    },
                    child: Text('Switch'),
                  ),
                ),
              ],
            ),

          )
        ],
      )
    );
  }
}
