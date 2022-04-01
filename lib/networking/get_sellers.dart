import 'dart:convert';

import 'package:abi_fruits_app/modal/seller.dart';
import 'package:http/http.dart' as http;

class GetSellers {
  static Future<List<Seller>> getSellers() async {
    const String _URL = "https://run.mocky.io/v3/3a138b0d-cf3b-4561-a271-536f3f20d805";
    var response = await http.get(Uri.parse(_URL));
    var body = jsonDecode(response.body);
    List<Seller> _list = [];
    for (int i = 0; i < body.length; i++) {
      Seller s = Seller(
        seller: body[i]["Seller"],
        product: body[i]["Product"],
        variety: body[i]["Variety"],
        price: body[i]["Price"],
        avgWeight: body[i]["AvgWeight"],
        perBox: body[i]["PerBox"],
        boxes: body[i]["Boxes"],
        delivery: body[i]["Delivery"]
      );
      _list.add(s);
    }

    _list.sort(
        (s1, s2) {
          return s1.seller.compareTo(s2.seller);
        }
    );

    return _list;
  }
}