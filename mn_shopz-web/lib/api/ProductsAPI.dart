import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modal/productData.dart';

class Products{
  Future <ProductDetails> getProducts() async{
    final response =await http.post(Uri.parse('http://localhost:8080/home/products'),
    headers: {
      'Content-Type': 'application/json',
    },
    );
    print(response.body);
    return ProductDetails.fromJson(jsonDecode(response.body));

  }
  

}