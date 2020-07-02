import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pallimart/colors/colors.dart';
import 'package:pallimart/custom_toolbar.dart';
import 'package:pallimart/screens/login_screen.dart';
import 'package:pallimart/utils/category_model.dart';
import 'package:pallimart/utils/home_list_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<CategoryModel> myList = List<CategoryModel>();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = '', userEmail = '';
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  List<String> exploreBrands = [
    'images/headphone.jpeg',
    'images/purse.jpg',
    'images/dryer.jpeg',
    'images/wifi.jpeg',
    'images/phone44.jpeg',
    'images/phone45.jpeg'
  ];
  List<String> categoryImage = [
    'images/grocery.png',
    'images/icon_fashion.png',
    'images/icon_furniture.png',
    'images/icon_appliance.png'
  ];
  List<String> categoryName = [
    'Grocery',
    'Apparel',
    'Furniture',
    'Home Decoration'
  ];

  @override
  void initState() {
    super.initState();
    print('init finished');
    setUserData();
  }

  Future<String> setUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ?? '';
      userEmail = prefs.getString('email') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Container(
          width: 250.3,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    /* Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ProfileScreen(token)));*/
                  },
                  child: Container(
                    color: MyColor.navigationHeaderColor,
                    height: 200.3,
                    child: DrawerHeader(
                      padding: EdgeInsets.zero,
                      child: Container(
                          child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 20),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 60,
                                  width: 46.3,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                          height: 46.3,
                                          width: 46.3,
                                          margin: EdgeInsets.only(top: 10),
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: new AssetImage(
                                                      "images/girl_dp.jpg")))),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 5, bottom: 3),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            width: 10,
                                            height: 10,
                                            decoration: new BoxDecoration(
                                              color: MyColor.themeColor,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              padding:
                                  EdgeInsets.only(left: 15, top: 20, right: 4),
                              child: Text(
                                userName ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'GilroySemibold',
                                    color: Colors.white),
                              )),
                          Container(
                              width: double.infinity,
                              padding:
                                  EdgeInsets.only(left: 15, top: 7, right: 5),
                              child: Text(
                                userEmail ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'GilroySemibold',
                                    color: Colors.white),
                              )),
                        ],
                      )),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Account',
                    style: TextStyle(
                        fontSize: 16,
                        color: MyColor.textBlueColor,
                        decoration: TextDecoration.none,
                        fontFamily: 'GilroySemibold'),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Orders',
                    style: TextStyle(
                        fontSize: 16,
                        color: MyColor.textBlueColor,
                        decoration: TextDecoration.none,
                        fontFamily: 'GilroySemibold'),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Buy Again',
                    style: TextStyle(
                        fontSize: 16,
                        color: MyColor.textBlueColor,
                        decoration: TextDecoration.none,
                        fontFamily: 'GilroySemibold'),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Shop by Category',
                    style: TextStyle(
                        fontSize: 16,
                        color: MyColor.textBlueColor,
                        decoration: TextDecoration.none,
                        fontFamily: 'GilroySemibold'),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 16,
                        color: MyColor.textBlueColor,
                        decoration: TextDecoration.none,
                        fontFamily: 'GilroySemibold'),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Log Out',
                    style: TextStyle(
                        fontSize: 16,
                        color: MyColor.textBlueColor,
                        decoration: TextDecoration.none,
                        fontFamily: 'GilroySemibold'),
                  ),
                  onTap: () {
                    showLogOutDialog(context);
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home, color: MyColor.themeColor),
              title: new Text(
                'Home',
                style: TextStyle(color: MyColor.themeColor),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.card_giftcard),
              title: new Text('Orders'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(
                  'Profile',
                )),
          ],
        ),
        body: Builder(
          builder: (ctx) => SafeArea(
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.zero,
                  elevation: 6,
                  child: Container(
                      height: 55,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Scaffold.of(ctx).openDrawer();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset('images/hamber2.png',
                                    width: 22.3, height: 14.3),
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Center(
                                child: Container(
                              child: Text(
                                'Dashboard',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: MyColor.textBlueColor,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'GilroySemibold'),
                              ),
                            )),
                            flex: 5,
                          ),
                          Expanded(
                            child: Container(
                                height: 40.3,
                                width: 25.3,
                                margin: EdgeInsets.only(right: 10),
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new AssetImage(
                                          "images/girl_dp.jpg",
                                        )))),
                            flex: 1,
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 12, bottom: 10),
                        child: SizedBox(
                            height: 162.0,
                            width: 350.0,
                            child: Carousel(
                              images: [
                                //NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                                ExactAssetImage("images/phone_banner.png"),
                                ExactAssetImage("images/banner3.jpg"),
                                ExactAssetImage("images/banner5.jpg"),
                                ExactAssetImage("images/banner4.jpg"),
                                ExactAssetImage("images/phone_banner2.jpg"),
                              ],
                              dotSize: 4.0,
                              dotSpacing: 15.0,
                              autoplay: true,
                              autoplayDuration: Duration(seconds: 4),
                              dotColor: Colors.blue,
                              indicatorBgPadding: 5.0,
                              dotBgColor:
                                  MyColor.gradientStart.withOpacity(0.2),
                              borderRadius: true,
                            )),
                      ),
                      Container(
                          height: 106,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categoryName.length,
                              padding: EdgeInsets.only(left: 12, right: 12),
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () =>
                                        Navigator.pushNamed(context, "/search"),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          4.3,
                                      child: Card(
                                        color: Colors.white,
                                        margin: EdgeInsets.only(
                                            bottom: 16,
                                            left: 4,
                                            right: 4,
                                            top: 8.0),
                                        elevation: 8.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              categoryImage[index],
                                              height: 42,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              categoryName[index] ?? '',
                                              style: TextStyle(
                                                  color: MyColor.homeTextColor,
                                                  fontSize: 12,
                                                  fontFamily: "Gilroy",
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                              })),
                      SizedBox(
                        height: 8,
                      ),
                      TitleText("Today’s deal"),
                      SizedBox(
                        height: 8,
                      ),
                      HomeListView(),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(color: MyColor.greyDivider),
                      TitleText("Explore Brands"),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                          height: 72,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: exploreBrands.length,
                              padding: EdgeInsets.only(left: 12, right: 12),
                              itemBuilder: (context, index) {
                                return Container(
                                  color: Colors.white,
                                  margin: EdgeInsets.only(left: 4, right: 4),
                                  width:
                                      MediaQuery.of(context).size.width * .38,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.0),
                                      child: Image.asset(
                                        exploreBrands[index],
                                        height: 70,
                                      )),
                                );
                              })),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(color: MyColor.greyDivider),
                      TitleText("Popular Product"),
                      SizedBox(
                        height: 8,
                      ),
                      HomeListView()
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  showLogOutDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            ModalRoute.withName("/home"));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Log Out"),
      content: Text("Are you sure you want to Log out ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class TitleText extends StatelessWidget {
  final title;

  TitleText(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Text(
        title ?? '',
        style: TextStyle(
            color: MyColor.homeTitleColor,
            fontSize: 18,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
