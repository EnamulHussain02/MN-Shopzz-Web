import 'dart:convert';
import 'package:http/http.dart' as http;

import '../modal/specificProduct.dart';



class SelectedProducts{
  Future <ProductEmpty> getSpecficProduct(String productId) async{
    Map<String, dynamic> responseBody={"prodId":productId};
    String requestBodyJson=json.encode(responseBody);
    final response =await http.post(Uri.parse('http://localhost:8080/home/sendProduct'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestBodyJson,
    );
    print(response.body);

    return ProductEmpty.fromJson(jsonDecode(response.body));

  }
}