
import 'package:flutter/material.dart';
import 'package:mn_shopz/addProduct.dart';
import 'package:mn_shopz/api/ProductsAPI.dart';
import 'package:mn_shopz/login.dart';
import 'package:mn_shopz/modal/productData.dart';
import 'package:mn_shopz/viewProduct.dart';

class Landing extends StatefulWidget {

  final String cusNumber;
  final String type;

  const Landing({Key? key, required this.cusNumber, required this.type, }) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  final prodDetails = Products();
  List<Product> productList=[];

  @override
  void initState() {
    super.initState();
    getData();
  }
  Future<void> getData() async{
    ProductDetails productDetails = await prodDetails.getProducts();
    setState((){
      productList= productDetails.products;
    });
    print(productList[0].productName);
  }

  var myInitialItem1 = 'Select Category';
  var myInitialItem2 = 'Price';
  var myInitialItem3 = 'Offer';
  var myInitialItem4 = 'Color';
  List<String> myItems1 = ['Select Category', 'Mobiles', 'Computers', 'Laptop'];
  List<String> myItems2 = [
    'Price',
    'under 10,000',
    '10,000-30,000',
    '30,000-50,000'
  ];
  List<String> myItems3 = [
    'Offer',
    '20% and more',
    '30% and more',
    '40% and more',
    '50% and more',
  ];
  List<String> myItems4 = [
    'Color',
    'Black',
    'Blue',
    'Green',
  ];

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
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        AddProduct()));
                      },
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddProduct()));
                        },
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
                                builder: (context) =>  Login()));
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
                          ),
                        ),
                      ),
                    ),
                    margin: EdgeInsets.only(right: 223),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column
                    (children: [
                    //Add Box on after header
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              color: Color(0xFFBEDBD7),
                              width: 1439.0,
                              height: 300.0,
                              margin: EdgeInsets.only(top: 24.0),
                              child: Row(
                                children: [
                                  Column(children: [
                                    Container(
                                      height: 80,
                                      margin: EdgeInsets.only(left: 100, top: 80),
                                      child: Text(
                                        "Buy Up to 50% off on Selected \nLaptop's",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF03433B),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 0),
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
                                    )
                                  ]),
                                  Stack(
                                    children: [
                                      Container(
                                        width: 216.0,
                                        height: 189,
                                        margin: EdgeInsets.only(
                                            left: 143.0, top: 25.0),
                                        child: Image.asset(
                                          'assets/images/macBook.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        width: 216.0,
                                        height: 189,
                                        margin:
                                        EdgeInsets.only(left: 459, top: 25.0),
                                        child: Image.asset(
                                            'assets/images/asusRog.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                      Container(
                                        width: 216.0,
                                        height: 224.0,
                                        margin:
                                        EdgeInsets.only(left: 301, top: 10.0),
                                        child: Image.asset(
                                          'assets/images/dellGaming.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // dropdowns
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFFDCE6E5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: DropdownButton(
                            onChanged: (value) {
                              setState(() {
                                myInitialItem1 = value.toString();
                              });
                            },
                            underline: Container(
                              color: Color(0xFFFFFFFF),
                            ),
                            disabledHint: Text('Select Category'),
                            value: myInitialItem1,
                            items: myItems1.map((items) {
                              return DropdownMenuItem(
                                  value: items, child: Text(items));
                            }).toList(),
                            focusColor: Color(0xffDCE6E5),
                            dropdownColor: Color(0xffDCE6E5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          margin: EdgeInsets.only(top: 10),
                          // color: Color(),
                        ),
                        Container(
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFFDCE6E5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: DropdownButton(
                            onChanged: (value) {
                              setState(() {
                                myInitialItem2 = value.toString();
                              });
                            },
                            underline: Container(
                              color: Color(0xFFFFFFFF),
                            ),
                            disabledHint: Text('Select Category'),
                            value: myInitialItem2,
                            items: myItems2.map((items) {
                              return DropdownMenuItem(
                                  value: items, child: Text(items));
                            }).toList(),
                            focusColor: Color(0xffDCE6E5),
                            dropdownColor: Color(0xffDCE6E5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          margin: EdgeInsets.only(left: 100, top: 10),
                          // color: Color(),
                        ),
                        Container(
                          width: 130,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFFDCE6E5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: DropdownButton(
                            onChanged: (value) {
                              setState(() {
                                myInitialItem3 = value.toString();
                              });
                            },
                            underline: Container(
                              color: Color(0xFFFFFFFF),
                            ),
                            disabledHint: Text('Select Category'),
                            value: myInitialItem3,
                            items: myItems3.map((items) {
                              return DropdownMenuItem(
                                  value: items, child: Text(items));
                            }).toList(),
                            focusColor: Color(0xffDCE6E5),
                            dropdownColor: Color(0xffDCE6E5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          margin: EdgeInsets.only(left: 100, top: 10),
                          // color: Color(),
                        ),
                        Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFFDCE6E5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: DropdownButton(
                            onChanged: (value) {
                              setState(() {
                                myInitialItem4 = value.toString();
                              });
                            },
                            underline: Container(
                              color: Color(0xFFFFFFFF),
                            ),
                            disabledHint: Text(
                              'Select Category',
                              style: TextStyle(fontSize: 16, fontFamily: 'Arial'),
                              textAlign: TextAlign.center,
                            ),
                            value: myInitialItem4,
                            items: myItems4.map((items) {
                              return DropdownMenuItem(
                                  value: items, child: Text(items));
                            }).toList(),
                            focusColor: Color(0xffDCE6E5),
                            dropdownColor: Color(0xffDCE6E5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          margin: EdgeInsets.only(left: 100, top: 10),
                        ),
                      ],
                    ),
                    // Recomended text
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Text('Recommended for You',

                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 25,
                              color: Color(0xFF000000),
                            ),),

                        )
                      ],
                    ),
                    // Products first row
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productList.length < 5 ? productList.length : 5,
                        itemBuilder: (BuildContext context, int index){
                          return Row(
                            children: [
                              Container(
                                width: 299.0,
                                height: 450.0,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    //image container
                                    Container(
                                      width: 250,
                                      height: 310,
                                      child: GestureDetector(
                                        onTap: (){
                                          String cusNumber=widget.cusNumber;
                                          String productId=
                                          productList[index].productId.toString();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ViewProduct(productId: productId,cusNumber: cusNumber) ));
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          child: Image.network(productList[index].productImage,
                                            fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    //product name
                                    Container(
                                      width: 261,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              productList[index].productName,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: 'Arial',
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //product desc
                                    Container(
                                      width: 261,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              productList[index].productName,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Arial',
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //Star
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          for (var i = 0; i < 5; i++)
                                            Icon(
                                              i <
                                                  int.parse(
                                                      productList[index]
                                                          .productStarratting)
                                                  ? Icons.star
                                                  : Icons.star_border,
                                              color: i <
                                                  int.parse(
                                                      productList[index]
                                                          .productStarratting)
                                                  ? Color(0xFFF26F20)
                                                  : Color(0xFFF26F20),
                                              size: 19,
                                            )
                                        ],
                                      ),
                                    ),
                                    //button and price
                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 137,
                                            height: 40,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Add to Cart',
                                                style: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 17,
                                                    color: Color(0xFFFFFFFF)
                                                ),
                                              ),
                                              style: TextButton.styleFrom(
                                                backgroundColor: Color(0xFF03433B),
                                                padding: EdgeInsets.all(12),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.currency_rupee,
                                                  color: Color(0xFF03433B),
                                                ),
                                                Text(
                                                  productList[index].productPrice.toString(),
                                                  style: TextStyle(
                                                      fontSize: 29,
                                                      fontFamily: 'Arial'
                                                  ),

                                                ),
                                              ],
                                            ),
                                          )


                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],


                          );
                        },
                      ),


                    ),
                    // Products second Row
                    SizedBox(
                      height: 456,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productList.length > 5 ? productList.length - 5 : 0,
                        itemBuilder: (BuildContext context, int index){
                          return Row(
                            children: [
                              Container(
                                width: 299.0,
                                height: 450.0,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    //image container
                                    Container(
                                      width: 250,
                                      height: 310,
                                      child: GestureDetector(
                                        onTap: (){
                                          String cusNumber=widget.cusNumber;
                                          String productId=productList[index + 5].productId.toString();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ViewProduct(productId: productId,cusNumber:cusNumber) ));
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          child: Image.network(productList[index + 5].productImage,
                                            fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    //product name
                                    Container(
                                      width: 261,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              productList[index + 5].productName,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: 'Arial',
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //product desc
                                    Container(
                                      width: 261,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              productList[index + 5].productName,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Arial',
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //Star
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          for (var i = 0; i < 5; i++)
                                            Icon(
                                              i <
                                                  int.parse(
                                                      productList[index + 5]
                                                          .productStarratting)
                                                  ? Icons.star
                                                  : Icons.star_border,
                                              color: i <
                                                  int.parse(
                                                      productList[index + 5]
                                                          .productStarratting)
                                                  ? Color(0xFFF26F20)
                                                  : Color(0xFFF26F20),
                                              size: 19,
                                            )
                                        ],
                                      ),
                                    ),
                                    //button and price
                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 137,
                                            height: 40,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Add to Cart',
                                                style: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 17,
                                                    color: Color(0xFFFFFFFF)
                                                ),
                                              ),
                                              style: TextButton.styleFrom(
                                                backgroundColor: Color(0xFF03433B),
                                                padding: EdgeInsets.all(12),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.currency_rupee,
                                                  color: Color(0xFF03433B),
                                                ),
                                                Text(
                                                  productList[index + 5].productPrice.toString(),
                                                  style: TextStyle(
                                                      fontSize: 29,
                                                      fontFamily: 'Arial'
                                                  ),

                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),


                    ),

                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
