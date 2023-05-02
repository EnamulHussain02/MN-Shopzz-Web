import 'package:flutter/material.dart';
import 'package:mn_shopz/register.dart';
import 'api/orderHistoryApi.dart';

import 'modal/orderHistoryModal.dart';

class Orders extends StatefulWidget {
  final String cusNumber;
  const Orders({Key? key, required this.cusNumber}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}



class _OrdersState extends State<Orders> {

  final showOrders=OrderHistory();
  List<Order> orderData=[];

  @override
  void initState(){
    super.initState();
    getData();
  }

  String orderId="";
  Future<void> getData()async {
    OrdersEmpty result=await showOrders.getOrders(widget.cusNumber) ;
    setState(() {
      orderData=result.orders;
    });

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only( left: 180,top: 23),
              child: Text('Orders',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color(0xFF2C2C2C)
              ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 21, left: 180),
              width: 1436,
              height: 292.5,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xFF03433B),
                      width: 1.0
                  )
              ),
                child: SizedBox(
                  height: 291* orderData.length.toDouble(),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: orderData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Container(
                      child: Row(
                      children: [
                      Container(
                      width: 1433,
                      height: 80,
                      color: Color(0xFFBEDBD7),
                      child: Row(
                      children: [
                      Container(
                      margin: EdgeInsets.only(left: 39),
                      child: Text('Order Number : '+ orderData[index].oId.toString(),
                      style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Arial',
                      color: Color(0xFF2C2C2C),
                      ),),
                      ),
                      Container(
                      margin: EdgeInsets.only(left: 1100),
                      child: Text(
                      orderData[index].paymentDate,
                      style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 20,
                      color: Color(0xFF2C2C2C),
                      ),
                      ),
                      ),

                      ],
                      ),
                      ),

                      ],
                      ),
                      ),
                      Container(
                      margin: EdgeInsets.only(left: 10, top: 35),
                      child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Container(
                      width: 142,
                      height: 142,
                      child: Image.network(orderData[index].productImage),
                      ),
                      Container(
                      margin: EdgeInsets.only( left: 20),
                      width: 798,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(orderData[index].prodTitel,
                      style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),
                      ),
                      Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Text(
                      orderData[index].prodDesc1),
                      )
                      ],
                      ),
                      ),
                      Container(
                      margin: EdgeInsets.only(left: 340),
                      child: Text(orderData[index].total.toString(),
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Arial'
                      ),),
                      )
                      ],
                      ),
                      )
                      ],
                      );
                    }
                  ),
                ),
            )

          ],
        ),
      ),

    );
  }
}