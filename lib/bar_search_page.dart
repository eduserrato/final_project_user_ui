import 'package:final_project_user_ui/main.dart';
import 'package:flutter/material.dart';
import 'package:final_project_user_ui/model/bar_item.dart';
import 'package:flutter/material.dart';
import 'model/drink_item.dart';

class SearchBarScreen extends StatefulWidget {

  //HERE IS WHERE YOU PUT ALL THE THINGS THAT WILL BE PULLED FROM THE CLOUD OR NEEDED.........................
  @override
  _SearchBarScreenState createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Container(
           child: ListView(
             children: <Widget>[
               searchBar(),
               SizedBox(height: 5),
               for(var barItem in barItemList.barItems)
               Builder(
                 builder: (context){
                   return BarContainer(barItem: barItem,); //here I have to put the barContainer I am working on
                 },
                )
             ],
           ),
         ), ),
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: <Widget>[
      //     Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),
      //     searchBar(),
      // ],
      //) 
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
                     List<FoodItem>foodItemsList = await foodItems();
          Navigator.push(context,
               MaterialPageRoute(builder: (context) => Home(foodItemsList)));
               
                     
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
                      // List<OrderItem> orderItemsList = await orderItems();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             OrdersScreen(orderItemsList)));
                      print(
                          'Bars Button Pressed'); ////HERE IS THE NAVEGATION TO OTHER PAGES
                    },
                  ),
                ],
              ))),
      
    );
  }
}

class BarContainer extends StatelessWidget {
  
  BarContainer({
    @required this.barItem,
  });

  final barItem;

  @override
  Widget build(BuildContext context) {
    return Bitems(
        barName: barItem.barName,
        location: barItem.location,
        phoneNumber: barItem.phoneNumber,
        imageUrl: barItem.imageUrl,
        //leftAligned: (barItem.id % 2) == 0 ? true : false,
      );
    
  }
}

class Bitems extends StatelessWidget {

  Bitems({
//    @required this.leftAligned,
    @required this.barName,
    @required this.location,
    @required this.phoneNumber,
    @required this.imageUrl,

  });

//  final bool leftAligned;
  final String barName;
  final String location;
  final int phoneNumber;
  final String imageUrl;

  @override

  Widget build(BuildContext context) {
    
    double containerPadding = 45;
    double containerBorderRadius = 10;
    
    return Column(
       children: <Widget>[
        Container(
          padding: EdgeInsets.only( 
            left: 5,
            right: 5,
          ),
      
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200, 
            decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                 borderRadius: BorderRadius.horizontal(
                   left: 
                      Radius.circular(containerBorderRadius),
                   right: 
                      Radius.circular(containerBorderRadius)

                 ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ), 
          ),
          SizedBox(height: 5),
          Container(
            // padding: EdgeInsets.only(
            //   left: leftAligned? 20 : 0,
            //   right: leftAligned? 0: 20,
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  
                    Text(barName, 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                  
                  Text("Location: $location", 
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),),
                  Text("Phone Number: $phoneNumber", 
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),),

                ],
            ),
          ),
          SizedBox(height: 15)
        ],
      ),
      ),
    ],
    );
    
       
  }
}