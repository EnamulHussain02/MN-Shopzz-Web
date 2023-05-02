
import 'package:flutter/material.dart';
import 'package:mn_shopz/login.dart';

import 'api/addProductApi.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  String name="";
  String price="";
  String quantity="";
  String type="";
  String color="";
  String discount="";
  String barcode="";
  String image="";
  String desc1="";
  String desc2="";
  String desc3="";
  String desc4="";

  TextEditingController nameController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController quantityController=TextEditingController();
  TextEditingController typeController=TextEditingController();
  TextEditingController colorController=TextEditingController();
  TextEditingController discountController=TextEditingController();
  TextEditingController barcodeController=TextEditingController();
  TextEditingController imageController=TextEditingController();
  TextEditingController desc1Controller=TextEditingController();
  TextEditingController desc2Controller=TextEditingController();
  TextEditingController desc3Controller=TextEditingController();
  TextEditingController desc4Controller=TextEditingController();

  final addNew=NewProducts();

  Future<void> setProducts(String name,String price,String quantity,String type,String color,String discount,String barcode,String image,String desc1,String desc2,String desc3,String desc4)async {
    String result=addNew.addNew(name,price,quantity,type,color,discount,barcode,image,desc1,desc2,desc3,desc4) as String;
  }

  var myInitialItem1 = 'User';
  List<String> myItems1 = ['User', 'Seller'];

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
      body: Column(
        children: [
          Expanded(child:
          SingleChildScrollView(
            child:
          Column(
            children: [
              Container(
                width: 1438,
                height: 745,
                margin: EdgeInsets.only(left: 170, top: 71),
                color: Color(0xFFBEDBD7),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text('Add Product',
                        style: TextStyle(
                          color: Color(0xFF03433B),
                          fontFamily: 'Arial',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 247,top: 23),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Product name',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Arial',
                                  color: Color(0xFF03433B),
                                ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 451,
                                height: 50,
                                child: TextField(
                                  controller: nameController,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 43,top: 23),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Product Price',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Arial',
                                    color: Color(0xFF03433B),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 451,
                                height: 50,
                                child: TextField(
                                  controller: priceController,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 247,top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Product quantity',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Arial',
                                    color: Color(0xFF03433B),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 451,
                                height: 50,
                                child: TextField(
                                  controller: quantityController,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 43,top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Product Type',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Arial',
                                    color: Color(0xFF03433B),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 451,
                                height: 50,
                                child: TextField(
                                  controller: typeController,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 247,top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Product Color',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Arial',
                                    color: Color(0xFF03433B),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 451,
                                height: 50,
                                child: TextField(
                                  controller: colorController,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 43,top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Product discount',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Arial',
                                    color: Color(0xFF03433B),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 451,
                                height: 50,
                                child: TextField(
                                  controller: discountController,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 247,top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Product barcode',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Arial',
                                    color: Color(0xFF03433B),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 451,
                                height: 50,
                                child: TextField(
                                  controller: barcodeController,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 43,top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Product Image',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Arial',
                                    color: Color(0xFF03433B),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    width: 322,
                                    height: 50,
                                    child: TextField(
                                      controller: imageController,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color(0xFFFFFFFF),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xFF03433B)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xFF03433B)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    width: 118,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xFF03433B)),
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 18),
                                              child: Icon(
                                                Icons.upload_file_outlined,
                                                color: Color(0xFF03433B),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                              child: Text(
                                                'Upload',
                                                style: TextStyle(color:  Color(0xFF03433B),),
                                              ),
                                            ),

                                      ],
                                    ),
                                  )
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 247,top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Product Description 1',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Arial',
                                    color: Color(0xFF03433B),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 451,
                                height: 50,
                                child: TextField(
                                  controller: desc1Controller,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 43,top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Product Description 2',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Arial',
                                    color: Color(0xFF03433B),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 451,
                                height: 50,
                                child: TextField(
                                  controller: desc2Controller,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 247,top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Product Description 3',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Arial',
                                    color: Color(0xFF03433B),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 451,
                                height: 50,
                                child: TextField(
                                  controller: desc3Controller,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 43,top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Product Description 4',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Arial',
                                    color: Color(0xFF03433B),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 451,
                                height: 50,
                                child: TextField(
                                  controller: desc4Controller,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF03433B)),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 224,
                          height: 50,
                          margin: EdgeInsets.only(left: 247,top: 36),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(
                                  context);
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Color(
                                    0xFF4A4A4A),
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
                                  0xFFBEDBD7)),
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
                        Container(
                          width: 224,
                          height: 50,
                          margin: EdgeInsets.only(left: 497,top: 36),
                          child: ElevatedButton(
                            onPressed: () {
                              name=nameController.text;
                              price=priceController.text;
                              quantity=quantityController.text;
                              type=typeController.text;
                              color=colorController.text;
                              discount=discountController.text;
                              barcode=barcodeController.text;
                              image=imageController.text;
                              desc1=desc1Controller.text;
                              desc2=desc2Controller.text;
                              desc3=desc3Controller.text;
                              desc4=desc4Controller.text;
                              setProducts(name,price,quantity,type,color,discount,barcode,image,desc1,desc2,desc3,desc4);

                            },
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                color: Color(
                                    0xFFFFFFFF),
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
                                  0xFF03433B)),
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
    ),
          )
        ],
      ),


    );
  }
}
