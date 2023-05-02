import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mn_shopz/login.dart';

class Register extends StatefulWidget {

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var myInitialItem1 = 'User';
  List<String> myItems1 = ['User', 'Seller'];

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String selectedValue="";

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
                      onPressed: () {},
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
                        margin: EdgeInsets.only(right: 500),
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
                )),
          Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Register",
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
                          top: 17,
                        ),
                        width: 415,
                        height: 81,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User Name',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Arial",
                                  color: Color(0xFF2C2C2C)),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                fillColor: Color(0xFFFFFFFF),
                                // Set the desired color here
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF03433B),
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF03433B),
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
                          top: 16,
                        ),
                        width: 415,
                        height: 81,
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
                            SizedBox(height: 8),
                            TextField(
                              controller: numberController,
                              decoration: InputDecoration(
                                fillColor: Color(0xFFFFFFFF),
                                // Set the desired color here
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF03433B),
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF03433B),
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
                          top: 16,
                        ),
                        width: 415,
                        height: 81,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Create Password',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Arial",
                                  color: Color(0xFF2C2C2C)),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                fillColor: Color(0xFFFFFFFF),
                                // Set the desired color here
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF03433B),
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF03433B),
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
                          top: 16,
                        ),
                        width: 415,
                        height: 81,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Arial",
                                  color: Color(0xFF2C2C2C)),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              controller: addressController,
                              decoration: InputDecoration(
                                fillColor: Color(0xFFFFFFFF),
                                // Set the desired color here
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF03433B),
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF03433B),
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
                          top: 16,
                        ),
                        width: 415,
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer Type',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Arial",
                                  color: Color(0xFF2C2C2C)),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: 415,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width:1.0,
                                ),
                                color: Colors
                                    .white,
                              ),
                              child: DropdownButtonFormField(
                                onChanged: (value) {
                                  setState(() {
                                    myInitialItem1 = value.toString();
                                    selectedValue=value.toString();
                                  });
                                },
                                disabledHint: Text('Select Category'),
                                value: myInitialItem1,
                                items: myItems1.map((items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items,),
                                  );
                                }).toList(),
                                focusColor: Color(0xffDCE6E5),
                                dropdownColor: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(30),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 420,
                        margin: EdgeInsets.only(top: 29),
                        child: ElevatedButton(
                          onPressed: () async {
                            String name=nameController.text;
                            String number =numberController.text;
                            String password=passwordController.text;
                            String address=addressController.text;

                            Map<String, dynamic> requestBody = {
                              'cname': name,
                              'cnumber': number,
                              'cpassword': password,
                              'caddress': address,
                              'c_type': selectedValue
                            };

                            String requestBodyJson = json.encode(requestBody);
                            final response = await http.post(
                              Uri.parse('http://localhost:8080/home/newUser'),
                              headers: {
                                'Content-Type': 'application/json',
                              },
                              body: requestBodyJson,

                            );
                            print(response.body);
                            Map<String, dynamic> responseBody =
                            json.decode(response.body);
                            var status = responseBody['status'];
                            print(status);

                            if(status=='200'){
                              showDialog(context: context,
                                  builder: (BuildContext context)=>
                                      AlertDialog(
                                        content: Text(
                                          'You are Registred Successfully Please Login to Continue',
                                          style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16,
                                            color: Color(0xFF03433B)
                                          ),
                                        ),
                                        actions: [
                                          TextButton( onPressed:(){
                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                          builder: (context) =>  Login()));
                                          }, child: Text('ok',
                                            style: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 16,
                                                color: Color(0xFF03433B)
                                            ),))
                                        ],
                                      )
                              );
                            }
                            else
                            {
                              showDialog(context: context, builder: (BuildContext context)=>
                                  AlertDialog(
                                    content: Text(
                                      'Already Registered User Login to Continue',
                                      style: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 16,
                                          color: Color(0xFF03433B)
                                      ),
                                    ),
                                    actions: [
                                      TextButton( onPressed:(){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()));
                                      }, child: Text('ok'))
                                    ],
                                  )
                              );
                            }


                          },
                          child: const Text(
                            'Register',
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
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Already I have an account!",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Arial",
                                  color: Color(0xFF2C2C2C)),
                            ),
                            Text(
                              " Login",
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
                )
            )
          ],
        ),
      ),
    );
  }
}
