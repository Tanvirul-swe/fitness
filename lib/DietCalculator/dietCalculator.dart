import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DietCalculator extends StatefulWidget {
  static String id = 'DietCalculator';
  @override
  _DietCalculatorState createState() => _DietCalculatorState();
}

class _DietCalculatorState extends State<DietCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D343C),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF1D343C),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.75,
                color: Color(0xFF1D343C),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Height & Weight',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                      Text(
                        'Height',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF2A4852),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                      Text(
                        'Weight',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF2A4852),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Benefits',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Assume an athletic standing position, with the knees and hips slightly bent, feet shoulder-width apart, and the head and chest up. This will be your starting position.',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF8F92A1),
                          ),
                        ),
                        Container(
                          width: 119.0,
                          height: 119.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(6, (int index) {
                              return Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20.0),
                                      image: DecorationImage(
                                        image:
                                            AssetImage('Image/pic$index.jpg'),
                                        fit: BoxFit.cover,
                                      )),
                                  width: 119.0,
                                  height: 119.0,
                                ),
                              );
                            }),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('What you get',style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Assume an athletic standing position, with the knees and hips slightly bent, feet shoulder-width apart, and the head and chest up. This will be your starting position.',
                                style: TextStyle(color: Color(0xFF8F92A1)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
