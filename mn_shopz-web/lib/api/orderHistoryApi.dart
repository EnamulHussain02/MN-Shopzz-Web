import 'dart:convert';
import 'package:http/http.dart' as http;

import '../modal/orderHistoryModal.dart';

class OrderHistory{
  Future<OrdersEmpty> getOrders(String cusNumber) async {
    print(cusNumber);
    Map<String, dynamic> responseBody={"customer_number":cusNumber};

    String requestBodyJson=json.encode(responseBody);

    final response =await http.post(Uri.parse('http://localhost:8080/home/orders'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestBodyJson,
    );
    print(response.body);
    return OrdersEmpty.fromJson(jsonDecode(response.body));
  }
}