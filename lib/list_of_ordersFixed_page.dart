import 'package:flutter/material.dart';
import 'model/drink_item.dart';
import 'model/orderFixed_item.dart';
import './main.dart';
import './bar_search_page.dart';
//This will brake if you delete products because it wont find the information of the order.

class OrdersFixedScreen extends StatefulWidget {
  List<OrderFixedItem>orderFixedItemsList;
  OrdersFixedScreen(this.orderFixedItemsList);
  @override
  _OrdersFixedScreenState createState() => _OrdersFixedScreenState();
}

class _OrdersFixedScreenState extends State<OrdersFixedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Container(
        child: 
        ListView(children: <Widget>[
          SizedBox(height: 5,),
          for(var orderItem in widget.orderFixedItemsList)
          Builder(builder: (context){
            return OrderContainer(orderFixedItem: orderItem); // .........................here add the orderItem
          },)
        ],)
      ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
              color: Color(0xFFBA55D3),
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MaterialButton(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.local_bar),
                          Text("Products"),
                        ]),
                    onPressed: () async {
                       List<FoodItem> foodItemsList = await foodItems();
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) =>
                                   Home(foodItemsList)));
                     
                      print('Products Button Pressed'); ////HERE IS THE NAVEGATION TO OTHER PAGES
                    },
                  ),
                  MaterialButton(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.location_on),
                          Text("Bars"),
                        ]),
                    onPressed: () async {
                      // List<OrderItem> orderItemsList = await orderItems();
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) =>
                                   SearchBarScreen()));
                      print(
                          'Bars Button Pressed'); ////HERE IS THE NAVEGATION TO OTHER PAGES
                    },
                  ),
                  MaterialButton(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.receipt),
                          Text("Tab"),
                        ]),
                    onPressed: () async {
                      List<OrderFixedItem> orderFixedItemsList = await orderFixedItems();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OrdersFixedScreen(orderFixedItemsList)));
                      print('Orders Button Pressed');
                    },
                  ),
                ],
              ))),
    );
  }
}

class OrderContainer extends StatelessWidget {

  OrderContainer({
    @required this.orderFixedItem,
  });

  final orderFixedItem;

  @override
  Widget build(BuildContext context) {
    return Oitems(
      
      orderId: orderFixedItem.order_id,
      orderGroup: orderFixedItem.order_Group,
      orderTotalPrice: orderFixedItem.order_Total_Price,
      ready: orderFixedItem.ready,
      delivered: orderFixedItem.delivered,
    );
  }
}

class Oitems extends StatelessWidget {

  Oitems({
  @required this.orderId,
  @required this.orderGroup,
  @required this.orderTotalPrice,
    this.ready,
    this.delivered,
  });

  String orderId;
  String orderGroup;
  double orderTotalPrice;
  bool ready;
  bool delivered;

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        
            Card(

              margin: const EdgeInsets.all(10),
             // decoration: myBoxDecoration() ,
              child:Column(
                children: <Widget>[
                Text("$orderGroup", style: TextStyle(
                  fontSize: 20,
                fontWeight: FontWeight.bold,
                
              ),),
              
                Text("    Order id: $orderId", style: TextStyle(
                  fontSize: 15
                ),),
                 Text("    Order Total: \$$orderTotalPrice", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),),
                Padding(padding: EdgeInsets.fromLTRB(10, 5,10, 20)),
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Container(child: Text("Waiting....")),
                Container(child: Text("Ready")),
                Container(child: Text("Delivered"),)
              ],)
                ],
            ),
          
        


        )

      ],
    );
  }
}

BoxDecoration myBoxDecoration(){
  return BoxDecoration(
    
    borderRadius: BorderRadius.all(
      Radius.circular(5)
    ),
    border: Border.all()
  );
}