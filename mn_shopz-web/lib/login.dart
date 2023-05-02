import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mn_shopz/register.dart';
import 'package:mn_shopz/viewProduct.dart';

import 'landing.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String number="";
  String password="";
  TextEditingController numberController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Image.asset(
            'assets/images/logo.jpg',
            height: 42,
            width: 184,
          ),
          margin: EdgeInsets.only(left: 100),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 100.0,
        actions: <Widget>[
          Positioned(
            child: ButtonBar(
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'About',
                      style: TextStyle(
                        color: Color(0xFF2C2C2C),
                        fontFamily: 'Arial',
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color(0xFFFFFFFF),
                    ),
                  ),
                  margin: EdgeInsets.only(right: 10),
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Products',
                        style: TextStyle(
                          color: Color(0xFF2C2C2C),
                          fontFamily: 'Arial',
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xFFFFFFFF),
                      )),
                  margin: EdgeInsets.only(right: 10),
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Order History',
                        style: TextStyle(
                          color: Color(0xFF2C2C2C),
                          fontFamily: 'Arial',
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xFFFFFFFF),
                      )),
                  margin: EdgeInsets.only(right: 10),
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Add New',
                        style: TextStyle(
                          color: Color(0xFF2C2C2C),
                          fontFamily: 'Arial',
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xFFFFFFFF),
                      )),
                  margin: EdgeInsets.only(right: 10),
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      child: const Text(
                        'Register/Login',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'Arial',
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.all(20),
                          backgroundColor: Color(0xFF03433B),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          )))),
                  margin: EdgeInsets.only(right: 223),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        width: 1440,
        height: 702,
        margin: EdgeInsets.only(left: 170, top: 71),
        color: Color(0xFFBEDBD7),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 170),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xFF03433B),
                          fontSize: 30,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 40,
                      ),
                      width: 415,
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mobile Number',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Arial",
                                color: Color(0xFF2C2C2C)),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: numberController,
                            decoration: InputDecoration(
                              fillColor: Color(0xFFFFFFFF),
                              // Set the desired color here
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF707070),
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF707070),
                                    style: BorderStyle.solid,
                                    width: 1.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      width: 415,
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Arial",
                                color: Color(0xFF2C2C2C)),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              fillColor: Color(0xFFFFFFFF),
                              // Set the desired color here
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF707070),
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF707070),
                                    style: BorderStyle.solid,
                                    width: 1.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 420,
                      margin: EdgeInsets.only(top: 29),
                      child: ElevatedButton(
                        onPressed: () async {
                          number=numberController.text;
                           password=passwordController.text;
                          print(number);
                          print(password);

                          Map<String, dynamic> requestBody= {
                            'cnumber':number,
                            'cpassword':password
                          };

                          String requestBodyJson = json.encode(requestBody);

                          final response =await http.post(
                            Uri.parse('http://localhost:8080/home/userLogin'),
                            headers: {
                              'Content-Type':'application/json'
                            },
                            body: requestBodyJson,
                          );
                            print(response.body);

                          Map<String, dynamic> responseBody =
                          json.decode(response.body);
                          var status = responseBody['status'];
                            var userNumber=responseBody['mobilenumber'.toString()];
                            var userType=responseBody['type'];
                            String receivednumber=userNumber.toString();
                            print("status:$status");
                          print("number:$userNumber");
                          print("type:$userType");

                          if (status=='201') {
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>
                                Landing(cusNumber: receivednumber,type: userType,),)

                          ); } else {
                            showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                          content:
                          Text('Failed to login. Please try again.'),
                          actions: [
                            TextButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Login()),
                          );
                            },
                          child: Text('OK'),
                          ),
                          ],
                          ),
                          );
                          }
                          },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.all(20),
                          backgroundColor: Color(0xFF03433B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 200,
                        top: 20,
                      ),
                      width: 415,
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "I don’t have an account! ",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Arial",
                                color: Color(0xFF2C2C2C)),
                          ),
                          Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Arial",
                                color: Color(0xFF5895B3)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(top: 170, left: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        margin: EdgeInsets.only(right: 195),
                        child: Text(
                          "Buy Upto 50% off on Selected \nLaptop's",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF03433B),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 521,top:10),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontFamily: 'Arial',
                                fontSize: 16,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: EdgeInsets.all(15),
                                backgroundColor: Color(0xFF03433B),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                )))),
                      ),
                      Stack(
                        children: [
                          Container(
                              width: 222,
                              height: 189,
                              margin: EdgeInsets.only(left: 40.0, top: 25.0),
                              child: Image.network(
                                'assets/images/macBook.jpg',
                                fit: BoxFit.cover,
                              )),
                          Container(
                            width: 222,
                            height: 189,
                            margin: EdgeInsets.only(left: 360, top: 25.0),
                            child: Image.network(
                              'assets/images/asusRog.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                              width: 222,
                              height: 224,
                              margin: EdgeInsets.only(left: 200, top: 10.0),
                              child: Image.network(
                                'assets/images/dellGaming.jpg',
                                fit: BoxFit.fill,
                              ))
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
