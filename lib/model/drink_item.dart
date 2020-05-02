import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


// FooditemList fooditemList = FooditemList(foodItems: [
   
//    //HERE I NEED TO CHANGE FOOD ITEMS TO THE REST CALL AND LIST OF FOOD ITEMS

//   FoodItem(
//     id: 1,
//     title: "Vegas Bomb",
//     hotel: "Hotel Discotheque",
//     price: 10.00,
//     imgUrl:
//         "https://i2.chefiso.com/srv/images/vegasbomb-splash-coverblock-850x850.jpg",
//   ),
//   FoodItem(
//     id: 2,
//     title: "Tequila Patron Shot",
//     hotel: "Hotel Discotheque",
//     price: 7.99,
//     imgUrl:
//         "https://i.pinimg.com/236x/cc/93/ab/cc93ab4c431d4920c67169f7010fb829--patron-silver-tequila-tequila-shots.jpg",
//   ),
//   FoodItem(
//     id: 3,
//     title: "Vodka Mango Shot",
//     hotel: "Hotel Discotheque",
//     price: 5.00,
//     imgUrl: "https://i.pinimg.com/236x/b5/dd/70/b5dd70c8a963f03ccae6987e82af4ad9.jpg",
//   ),
//   FoodItem(
//     id: 4,
//     title: "Jaguer Bomb",
//     hotel: "Hotel Discotheque",
//     price: 10.00,
//     imgUrl: "https://www.dictionary.com/e/wp-content/uploads/2018/04/jager-bomb-300x300.jpg",
//   ),
//   FoodItem(
//     id: 5,
//     title: "La Bandera Shot",
//     hotel: "Hotel Discotheque",
//     price: 14.99,
//     imgUrl: "https://i.pinimg.com/236x/c1/f7/38/c1f738e2e9e62a269378ecb81cc68ed6--sangrita-recipe-mexican-flags.jpg",
//   ),
//   FoodItem(
//     id: 6,
//     title: "Sex on the Beach Shot",
//     hotel: "Hotel Discotheque",
//     price: 5.99,
//     imgUrl:
//         "https://tipsybartender.imgix.net/2018/01/Creamy-Sex-on-the-Beach-Shots.jpg",
//   ),
// ]);

// class FooditemList {
//   List<FoodItem> foodItems;

//   FooditemList({@required this.foodItems});
// }

class FoodItem {
  String id;
  String title;
  String hotel;
  double price;
  String imgUrl;
  int quantity;

  FoodItem({
    @required this.id,
    @required this.title,
    @required this.hotel, // this should be CHANGED to BAR NAME.
    @required this.price,
    this.imgUrl,
    this.quantity = 1,
  });

  factory FoodItem.fromJson(Map<dynamic, dynamic> json){
    return FoodItem(
      id: json['_id'], 
      title: json['name'], 
     // quantity: json['quantity'], 
      hotel: json['bar'], 
      price: json['price'].toDouble(),
      imgUrl: json['imgUrl']
      );
  }

  void incrementQuantity() { // Increases the quantity
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() { // Decreases the quantity of a certain item
    this.quantity = this.quantity - 1;
  }
}

Future<List<FoodItem>>foodItems()async{
  List<FoodItem>foodItemsList = [];
  Map data1;
  List foodData;

  http.Response response = await http.get('http://10.0.2.2:3000/products');
  if (response.statusCode == 200){
    debugPrint(response.body);
    String serverText = response.body;
    data1 = json.decode(response.body);
    //List<dynamic> data = json.decode(serverText);
    foodData = data1['products'];
    for(int i = 0; i < foodData.length; i++){
      foodItemsList.add(FoodItem.fromJson(foodData[i]));
    }
    return foodItemsList;
  }
  else{
    print("Couldn't acces database");
    return null;
  }
}
