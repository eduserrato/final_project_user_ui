import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:final_project_user_ui/bar_search_page.dart';
import 'package:final_project_user_ui/bloc/listTileColorBloc.dart';
import 'package:final_project_user_ui/sign_up_page.dart';
import 'package:final_project_user_ui/bar_search_page.dart';
import 'package:flutter/material.dart';
//import 'package:food_delivery/bloc/listTileColorBloc.dart';
import 'bloc/cartlistBloc.dart';
import 'cart.dart';
import 'const/themeColor.dart';
import 'model/drink_item.dart';
import 'sing_in_page.dart';
import 'model/orderFixed_item.dart';
import './list_of_ordersFixed_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        //add yours BLoCs controlles
        Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      child: MaterialApp(
        title: "Tipsy Delivery",
        home: LoginScreen(), // here is where you see what you ARE RUNNINGGG!!!!!!!!!!
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Home extends StatefulWidget {
  List<FoodItem>foodItemsList;
  Home(this.foodItemsList);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: ListView(
          children: <Widget>[
            FirstHalf(),
            SizedBox(height: 45),
            for (var foodItem in widget.foodItemsList)
              Builder(
                builder: (context) {
                  return ItemContainer(foodItem: foodItem);
                },
              )
          ],
        ),
      )),
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
                      // List<FoodItem> foodItemsList = await foodItems();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             ProductsScreen(foodItemsList)));
                     
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


class ItemContainer extends StatelessWidget {
  
  ItemContainer({
    @required this.foodItem,
  });

  final FoodItem foodItem;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  
  addToCart(FoodItem foodItem) {  // Here Are The Gestures;
    bloc.addToList(foodItem);
  }

  removeFromList(FoodItem foodItem) {
    bloc.removeFromList(foodItem);
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(foodItem);
        final snackBar = SnackBar(
          content: Text('${foodItem.title} added to Cart'),
          duration: Duration(milliseconds: 550),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Items(
        hotel: foodItem.hotel,
        itemName: foodItem.title,
        itemPrice: foodItem.price,
        imgUrl: foodItem.imgUrl,
      ),
    );
  }
}

class FirstHalf extends StatelessWidget {
  const FirstHalf({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 25, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          //you could also use the spacer widget to give uneven distances, i just decided to go with a sizebox
          SizedBox(height: 30),
          title(),
          SizedBox(height: 30),
          searchBar(),
          SizedBox(height: 45),
          categories(),
        ],
      ),
    );
  }
}

Widget categories() { //THIS WILL BE PULLED FROM THE API, THE CATEGORIES.................
  return Container(
    height: 185,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        CategoryListItem(
          categoryIcon: Icons.local_bar,
          categoryName: "Shots",
          availability: 12,
          selected: true,
        ),
        CategoryListItem(
          categoryIcon: Icons.local_bar,
          categoryName: "Mixed Drinks",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.local_bar,
          categoryName: "Bottles",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.local_bar,
          categoryName: "Beers",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.local_bar,
          categoryName: "Old Fashoned",
          availability: 12,
          selected: false,
        ),
      ],
    ),
  );
}

class Items extends StatelessWidget { //HERE START ITEMS....................
  Items({
    this.imgUrl,
    @required this.itemName,
    @required this.itemPrice,
    @required this.hotel,
  });

  final String imgUrl;
  final String itemName;
  final double itemPrice;
  final String hotel;

  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerBorderRadius = 10;

    return Column(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(0),
                    right: Radius.circular(0),
                  ),
                  child: Image.network(
                    "$imgUrl", // Change this later after modifying the data base.
                     //"https://i2.chefiso.com/srv/images/vegasbomb-splash-coverblock-850x850.jpg",

                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(

                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(itemName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  )),
                            ),
                            Text("\$$itemPrice",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                )),
                          ],
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 15),
                                children: [
                                  TextSpan(text: "by "),
                                  TextSpan(
                                      text: hotel,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700))
                                ]),
                          ),
                        ),
                        SizedBox(height: containerPadding),
                      ])),
            ],
          ),
        )
      ],
    );
  }
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    Key key,
    @required this.categoryIcon,
    @required this.categoryName,
    @required this.availability,
    @required this.selected,
  }) : super(key: key);

  final IconData categoryIcon;
  final String categoryName;
  final int availability;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: selected ? Themes.color : Colors.white,
        border: Border.all(
            color: selected ? Colors.transparent : Colors.grey[200],
            width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 15,
            offset: Offset(15, 0),
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: selected ? Colors.transparent : Colors.grey[200],
                    width: 1.5)),
            child: Icon(
              categoryIcon,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(height: 10),
          Text(
            categoryName,
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.black, fontSize: 15),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 6, 0, 10),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            availability.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Icon(
        Icons.search,
        color: Colors.black45,
      ),
      SizedBox(width: 20),
      Expanded(
        child: TextField(
          decoration: InputDecoration(
              hintText: "Search....",
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              hintStyle: TextStyle(
                color: Colors.black87,
              ),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red))),
        ),
      ),
    ],
  );
}

Widget title() {                    //here is the title of the service and the second name
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(width: 45),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Tipsy Drink",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          Text(
            "Delivery Service",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 30,
            ),
          ),
        ],
      )
    ],
  );
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
          StreamBuilder(
            stream: bloc.listStream,
            builder: (context, snapshot) {
              List<FoodItem> foodItems = snapshot.data;
              int length = foodItems != null ? foodItems.length : 0;

              return buildGestureDetector(length, context, foodItems);
            },
          )
        ],
      ),
    );
  }

  GestureDetector buildGestureDetector(
      int length, BuildContext context, List<FoodItem> foodItems) {
    return GestureDetector(
      onTap: () {
        if (length > 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Cart()));
        } else {
          return;
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 30),
        child: Text(length.toString()),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Color(0xFFBA55D3), borderRadius: BorderRadius.circular(50)), // here is COLOR OF SMALL BOX
      ),
    );
  }
}
