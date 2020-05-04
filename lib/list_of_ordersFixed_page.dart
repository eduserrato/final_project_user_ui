import 'package:flutter/material.dart';
import 'model/drink_item.dart';
import 'model/orderFixed_item.dart';
import './main.dart';
import './bar_search_page.dart';
//This will brake if you delete products because it wont find the information of the order.

class OrdersFixedScreen extends StatefulWidget {
  List<OrderFixedItem> orderFixedItemsList;
  OrdersFixedScreen(this.orderFixedItemsList);
  @override
  _OrdersFixedScreenState createState() => _OrdersFixedScreenState();
}

class _OrdersFixedScreenState extends State<OrdersFixedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: ListView(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            for (var orderItem in widget.orderFixedItemsList)
              Builder(
                builder: (context) {
                  return OrderContainer(
                      orderFixedItem:
                          orderItem); // .........................here add the orderItem
                },
              )
          ],
        )),
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
                              builder: (context) => Home(foodItemsList)));

                      print(
                          'Products Button Pressed'); ////HERE IS THE NAVEGATION TO OTHER PAGES
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
                              builder: (context) => SearchBarScreen()));
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
                      List<OrderFixedItem> orderFixedItemsList =
                          await orderFixedItems();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OrdersFixedScreen(orderFixedItemsList)));
                      setState(() {});
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
      color1: orderFixedItem.color1,
      color2: orderFixedItem.color2,
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
    @required this.color1,
    @required this.color2,
    this.ready,
    this.delivered,
  });

  String orderId;
  String orderGroup;
  double orderTotalPrice;
  String color1;
  String color2;
  bool ready;
  bool delivered;

  @override
  Widget build(BuildContext context) {
 String orderName= '';
    List<String>sepOrder = orderGroup.split(' - ');
    for(int x = 0; x < sepOrder.length; x++)
    {
      orderName += '${sepOrder[x]} \n';
    }

    color1 = "Color($color1)";
    color2 = "Color($color2)";

    String valueColor1 = color1.split('(0x')[1].split(')')[0];
    int _color1 = int.parse(valueColor1, radix: 16);
    String valueColor2 = color2.split('(0x')[1].split(')')[0];
    int _color2 = int.parse(valueColor2, radix: 16);
    return Column(
      children: <Widget>[
        Card(
          margin: const EdgeInsets.all(10),
         elevation: 10,
     
          // decoration: myBoxDecoration() ,
          child: Column(
            children: <Widget>[
              Text(
                "$orderName",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "    Order id: $orderId",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "    Order Total: \$$orderTotalPrice",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                "Delivery Authentication Colors:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Color(_color1),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black)),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Color(_color2),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black)),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text("In Process"),
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Text("Ready"),
                      color: ready ? Colors.green : Colors.red,
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Text("Delivered"),
                    color: delivered ? Colors.green : Colors.red,
                  ))
                ],
              ),
              Padding(padding: EdgeInsets.all(5),)
            ],
          ),
        )
      ],
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)), border: Border.all());
}
