import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mn_shopz/orderHistory.dart';
import 'package:mn_shopz/register.dart';
import 'package:http/http.dart' as http;

import 'api/viewProductApi.dart';
import 'modal/specificProduct.dart';

class ViewProduct extends StatefulWidget {

  final String productId;
  final String cusNumber;

  const ViewProduct({
    required this.productId, Key? key, required this.cusNumber,
}): super(key: key);
  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {

  final products=SelectedProducts();
  List<Products> productOne=[];

  @override
  void initState(){
    super.initState();
    getData();
  }

  Future<void> getData() async{
    ProductEmpty empty= await products.getSpecficProduct(widget.productId);
    setState(() {
      productOne=empty.product;
    });
}

Future<void> saveOrder(
    BuildContext context, {required String Payment, required String prodId, required String cusNumber, required String total}
    ) async{
    Map<String, dynamic> requestBody={
      "payment_via":Payment,
      "customer_number": cusNumber,
      "product_detail_id": prodId,
      "total": total
    };
    String requestBodyJson= json.encode(requestBody);
    final response =await http.post(
      Uri.parse('http://localhost:8080/home/setOrders'),
      headers: {
        'Content-Type':'application/json'
      },
      body: requestBodyJson,
    );
}

  Future<void> showOrderSummary(
      BuildContext context,
      )async{
    String? ValueChoose;
    List myItems1 = ['Google Pay', 'PhonePe', 'Paytm'];
    bool isTextFieldEnabled= false;
    String upiId='';
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Container(
                width: 568,
                height: 465,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    // order Summary
                    Container(
                      child: Text(
                        'Order Summary (1 item)',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF03433B),
                        ),
                      ),
                    ),
                    //Price
                    Container(
                        margin:
                        EdgeInsets.only(top: 16),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                'Original Price',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(
                                        0xFF2C2C2C)),
                              ),
                            ),
                            Container(
                                margin:
                                EdgeInsets.only(
                                    left: 410,
                                    top: 17),
                                child: Text(
                                  productOne[0].productPrice,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily:
                                    'Arial',
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                  ),
                                ))
                          ],
                        )),
                    // Delivery Fee
                    Container(
                      margin:
                      EdgeInsets.only(top: 19),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              'Delivery Fees',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: 420, top: 20),
                              child: Text(
                                'Free',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Arial',
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ))
                        ],
                      ),
                    ),
                    //Total  amount
                    Container(
                      margin:
                      EdgeInsets.only(top: 19),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              'Total Amount',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: 420, top: 20),
                              child: Text(
                                productOne[0].productPrice,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Arial',
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ))
                        ],
                      ),
                    ),
                    // select payment text
                    Container(
                      margin:
                      EdgeInsets.only(top: 19),
                      child: Text(
                        'Select Payment Method',
                        style: TextStyle(
                            fontFamily: "Arial",
                            fontSize: 20,
                            fontWeight:
                            FontWeight.bold,
                            color: Color(0xFF03433B)),
                      ),
                    ),
                    // drop down
                    Container(
                      width: 566,
                      height: 50,
                      margin:
                      EdgeInsets.only(top: 9),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        border: Border.all(
                          color: Color(0xFF707070),
                          width: 1.0,
                        ),
                      ),
                      child: DropdownButton(
                        hint: Text('Select UPI Id'),
                        value: ValueChoose,
                        onChanged: (value) {
                          setState(() {
                            ValueChoose =
                                value.toString();
                            isTextFieldEnabled=true;
                          });
                        },
                        items: myItems1.map((valueItem){
                          return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem));
                        }).toList(),
                        underline: Container(
                          color: Color(0xFFFFFFFF),
                        ),
                        focusColor: Color(0xFFFFFFFF),
                        dropdownColor:
                        Color(0xFFFFFFFF),
                      ),
                    ),
                    Container(
                      margin:
                      EdgeInsets.only(top: 20),
                      child: Text(
                        'Enter UPI Id',
                        style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: Color(0xFF2C2C2C)),
                      ),
                    ),
                    Container(
                      margin:
                      EdgeInsets.only(top: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor:
                          Color(0xFFFFFFFF),
                          filled: true,
                          enabledBorder:
                          OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                              Color(0xFF707070),
                              style:
                              BorderStyle.solid,
                            ),
                          ),
                          focusedBorder:
                          OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                Color(0xFF707070),
                                style:
                                BorderStyle.solid,
                                width: 1.0),
                          ),
                        ),
                        enabled: isTextFieldEnabled,
                        onChanged: (value) {
                          setState(() {
                            upiId = value;
                          });
                        },
                      ),
                    ),
                    //Buttons
                    Container(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                        children: [
                          //Cancel button
                          Container(
                            width: 130,
                            height: 50,
                            margin: EdgeInsets.only(
                                top: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(
                                    context);
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Color(
                                      0xFF03433B),
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty
                                    .all<Color>(Color(
                                    0xFFFFFFFF)),
                                shape: MaterialStateProperty
                                    .all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        50),
                                    side: BorderSide(
                                      color: Color(
                                          0xFF03433B),
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                elevation:
                                MaterialStateProperty
                                    .all<double>(
                                    0),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          //Confirm button
                          Container(
                            width: 130,
                            height: 50,
                            margin: EdgeInsets.only(
                                top: 20),
                            child: Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  String Payment='UPI';
                                  String prodId=productOne[0].productId;
                                  String cusNumber=widget.cusNumber;
                                  String total=productOne[0].productPrice;
                                  saveOrder(context,Payment: Payment,prodId: prodId, cusNumber: cusNumber,total: total);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Orders(cusNumber: cusNumber) ));
                                },
                                child: const Text(
                                  'Confirm',
                                  style: TextStyle(
                                    color: Color(
                                        0xFFFFFFFF),
                                    fontFamily:
                                    'Arial',
                                    fontSize: 16,
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                  ),
                                ),
                                style: ElevatedButton
                                    .styleFrom(
                                  elevation: 0,
                                  padding:
                                  EdgeInsets.all(
                                      20),
                                  backgroundColor:
                                  Color(
                                      0xFF03433B),
                                  shape:
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius
                                        .all(
                                      Radius.circular(
                                          50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        );
      },
    );

  }

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
                      onPressed: () {
                        String cusNumber=widget.cusNumber;
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => Orders(cusNumber: cusNumber) ));
                      },
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
        width: 1396,
        height: 685,
        margin: EdgeInsets.only(left: 170, top: 71),
        child: Row(
          children: [
            // the main image
            Expanded(
                flex: 0,
                child: Column(
                  children: [
                    Container(
                      width: 576,
                      height: 576,
                      child: Image.network(productOne[0].productImage, fit: BoxFit.fill,),
                    ),
                    Container(
                      width: 576,
                      height: 66,
                      margin: EdgeInsets.only(top: 43),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 60,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back_rounded),
                                onPressed: () {
                                  // Handle back arrow press
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 66,
                              height: 66,
                              child: Image.network("src"),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 66,
                              height: 66,
                              child: Image.network("src"),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 66,
                              height: 66,
                              child: Image.network("src"),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 66,
                              height: 66,
                              child: Image.network("src"),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 60,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.arrow_forward_rounded),
                                onPressed: () {
                                  // Handle forward arrow press
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    // product Name
                    Container(
                      width: 762,
                      height: 60,
                      child: Text(productOne[0].productName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              fontFamily: 'Arial',
                              color: Color(0xFF2C2C2C))),
                    ),
                    // product Start Ratting
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < 5; i++)
                            Icon(
                              i <
                                  int.parse(
                                      productOne[0].productStarratting)
                                  ? Icons.star
                                  : Icons.star_border,
                              color: i <
                                  int.parse(
                                      productOne[0].productStarratting)
                                  ? Color(0xFFF26F20)
                                  : Color(0xFFF26F20),
                              size: 19,
                            )
                        ],
                      ),
                    ),
                    // product Color
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 38, left: 30),
                            child: Text(
                              'Color: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 38, left: 5),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black
                                ),
                          ),
                        ],
                      ),
                    ),
                    // product Price
                    Container(
                        child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 30, top: 31),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Price: ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    Icons.currency_rupee,
                                    // Use the money icon for Rupees symbol
                                    size: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: productOne[0].productPrice,
                                  // Add the value "45000" as a TextSpan
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                    ),
                    // Product Description
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 31),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Arial',
                                color: Color(0xFF2C2C2C)),
                          ),
                        ],
                      ),
                    ),
                    // desc1
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black // Set color of the circle
                                ),
                          ),
                          Container(
                            width: 720,
                            height: 53,
                            margin: EdgeInsets.only(top: 26, left: 12),
                            child: Text(
                              productOne[0].prodDesc1,
                              style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                  color: Color(0xFF2C2C2C)),
                            ),
                          )
                        ],
                      ),
                    ),
                    //desc2
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black // Set color of the circle
                                ),
                          ),
                          Container(
                            width: 720,
                            height: 53,
                            margin: EdgeInsets.only(top: 26, left: 12),
                            child: Text(
                              productOne[0].prodDesc2,
                              style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                  color: Color(0xFF2C2C2C)),
                            ),
                          )
                        ],
                      ),
                    ),
                    //desc3
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black // Set color of the circle
                                ),
                          ),
                          Container(
                            width: 720,
                            height: 53,
                            margin: EdgeInsets.only(top: 26, left: 12),
                            child: Text(
                              productOne[0].prodDesc3,
                              style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                  color: Color(0xFF2C2C2C)),
                            ),
                          )
                        ],
                      ),
                    ),
                    //desc4
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black // Set color of the circle
                                ),
                          ),
                          Container(
                            width: 720,
                            height: 53,
                            margin: EdgeInsets.only(top: 26, left: 12),
                            child: Text(
                              productOne[0].prodDesc4,
                              style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                  color: Color(0xFF2C2C2C)),
                            ),
                          )
                        ],
                      ),
                    ),
                    // buttons
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: 228,
                            margin: EdgeInsets.only(top: 29, left: 59),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(
                                    context);
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Color(0xFF03433B),
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20),
                                backgroundColor: Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  side: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),
                          Container(
                            width: 228,
                            margin: EdgeInsets.only(top: 29, left: 104),
                            child: ElevatedButton(
                              onPressed: () {
                                showOrderSummary(context);

                              },
                              child: const Text(
                                'Buy Now',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
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
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
