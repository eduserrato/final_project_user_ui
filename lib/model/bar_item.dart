import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

BaritemList barItemList = BaritemList(barItems: [

BarItem(
id: 0, 
barName: "Suerte",
location: "17th Street McAllen, Texas",
phoneNumber: 9565555555, 
imageUrl: "https://s3-media0.fl.yelpcdn.com/bphoto/BC4IcTtqeu4-CxL5IEUUEQ/o.jpg",
),
BarItem(
id: 1, 
barName: "NOX",
location: "17th Street McAllen, Texas",
phoneNumber: 9565555555, 
imageUrl: "https://images.squarespace-cdn.com/content/v1/59fdd426a9db0944e30783ac/1509809873287-9TG4UAS1YIK24B5KYJ3K/ke17ZwdGBToddI8pDm48kGHDgdpS2zuOvi4BRyw4gEN7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UZM8Hx2LBJ8FtmS3V8gP85K9O6gQ-Z6ElRnRdcEFflC36JueMwxDH6-6V_q58jMZYg/image-large-bar.jpg?format=1500w",
),
BarItem(
id: 2, 
barName: "VIBE",
location: "17th Street McAllen, Texas",
phoneNumber: 9565555555, 
imageUrl: "https://images.squarespace-cdn.com/content/v1/59fdd426a9db0944e30783ac/1509809873287-9TG4UAS1YIK24B5KYJ3K/ke17ZwdGBToddI8pDm48kGHDgdpS2zuOvi4BRyw4gEN7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UZM8Hx2LBJ8FtmS3V8gP85K9O6gQ-Z6ElRnRdcEFflC36JueMwxDH6-6V_q58jMZYg/image-large-bar.jpg?format=1500w",
),
BarItem(
id: 3, 
barName: "BAR 208",
location: "17th Street McAllen, Texas",
phoneNumber: 9565555555, 
imageUrl: "https://images.squarespace-cdn.com/content/v1/59fdd426a9db0944e30783ac/1509809873287-9TG4UAS1YIK24B5KYJ3K/ke17ZwdGBToddI8pDm48kGHDgdpS2zuOvi4BRyw4gEN7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UZM8Hx2LBJ8FtmS3V8gP85K9O6gQ-Z6ElRnRdcEFflC36JueMwxDH6-6V_q58jMZYg/image-large-bar.jpg?format=1500w",
),
BarItem(
id: 4, 
barName: "ROOF",
location: "17th Street McAllen, Texas",
phoneNumber: 9565555555, 
imageUrl: "https://images.squarespace-cdn.com/content/v1/59fdd426a9db0944e30783ac/1509809873287-9TG4UAS1YIK24B5KYJ3K/ke17ZwdGBToddI8pDm48kGHDgdpS2zuOvi4BRyw4gEN7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UZM8Hx2LBJ8FtmS3V8gP85K9O6gQ-Z6ElRnRdcEFflC36JueMwxDH6-6V_q58jMZYg/image-large-bar.jpg?format=1500w",
),
]);

class BaritemList{
  List<BarItem> barItems;

  BaritemList({@required this.barItems});
}

class BarItem{
  int id;
  String barName;
  String location;
  int phoneNumber;
  String imageUrl;

  //HERE ADD ANYTHING ELSE A BAR HAS TO OFFER

  BarItem({
    @required this.id,
    @required this.barName,
    @required this.location,
    @required this.phoneNumber,
    @required this.imageUrl,
  });

  //HERE I CAN ADD ANY VOIDS OR ACTIONS THAT WILL HAPPEN.
}


