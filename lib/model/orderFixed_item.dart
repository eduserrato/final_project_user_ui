import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
class OrderFixedItem{
  String order_Group;
  String order_id;
  double order_Total_Price;
  bool delivered;
  bool ready;

  OrderFixedItem({
    this.order_Group,
    this.order_id,
    this.order_Total_Price,
    this.delivered = false,
    this.ready = false,
  });

  factory OrderFixedItem.fromJson(Map<dynamic, dynamic> json){
    return OrderFixedItem(
      order_id: json['orderId'], 
      order_Group: json['orderGroup'], 
      order_Total_Price: json['orderTotalPrice'], 
      delivered: json['delivered'], 
      ready: json['ready'],
    );
  }
}

Future<List<OrderFixedItem>>orderFixedItems()async{
  List<OrderFixedItem>orderItemsList = [];
  Map data1;
  List ordersData;

  http.Response response = await http.get('http://10.0.2.2:3000/ordersFixed');
  if (response.statusCode == 200){
    debugPrint(response.body);
    String serverText = response.body;
    data1 = json.decode(response.body);
    //List<dynamic> data = json.decode(serverText);
    ordersData = data1['orders'];
    for(int i = 0; i < ordersData.length; i++){
      orderItemsList.add(OrderFixedItem.fromJson(ordersData[i]));
    }
    return orderItemsList;
  }
  else{
    print("Couldn't acces database");
    return null;
  }
}

Future orderFixedPost(String orderGroup, String orderTotalPrice) async{
 
 // Set up POST request arguments 
 var url = 'http://10.0.2.2:3000/ordersFixed';
 Map<String, String> headers = {"Content-type": "application/json"};
 String json = '{"orderGroup": "$orderGroup", "orderTotalPrice": "$orderTotalPrice"}';

 // Make POST request
 http.Response response = await http.post(url, headers: headers, body: json);

 // Check the status code for the result
 int statusCode = response.statusCode;

 // Here is the response
 String body = response.body;
 debugPrint(body);
}