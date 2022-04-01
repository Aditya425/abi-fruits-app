import 'package:abi_fruits_app/modal/seller.dart';
import 'package:abi_fruits_app/networking/get_sellers.dart';
import 'package:abi_fruits_app/screens/search_screen.dart';
import 'package:abi_fruits_app/screens/sort_screen.dart';
import 'package:abi_fruits_app/sort_types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Seller> sellers = [];
  int f = 0;
  @override
  void initState() {
    super.initState();
    getSellers();
  }

  void showSortScreen() async {
    await showModalBottomSheet(
        context: context, 
        builder: (context) => SortScreen(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
    );
    String value = Provider.of<SortTypes>(context, listen: false).sortType;
    sortList(value);
  }

  void sortList(String sortType) {
    if (sortType == "NAME_ASCENDING") {
      sellers.sort(
          (s1, s2) => s1.seller.compareTo(s2.seller)
      );
      setState(() {

      });
    } else if (sortType == "NAME_DESCENDING") {
      sellers.sort(
          (s1, s2) => -1 * s1.seller.compareTo(s2.seller)
      );
      print(sellers);
      setState(() {

      });
    } else if (sortType == "PRICE_ASCENDING") {
      sellers.sort(
          (s1, s2) => s1.price.compareTo(s2.price)
      );
      setState(() {

      });
    } else {
      sellers.sort(
              (s1, s2) => -1 * s1.price.compareTo(s2.price)
      );
      setState(() {

      });
    }
  }

  void getSellers() async {
    sellers = await GetSellers.getSellers();
    f = 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(237, 237, 237, 1),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Buy",
                      style: TextStyle(
                        color: Color(0xff121212),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Material(
                            elevation: 10,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => SearchScreen(sellers)));
                              },
                              child: TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(100),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(100),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    hintText: "Search",
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.sort),
                          onPressed: () {
                            showSortScreen();
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset("images/img1.png"),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset("images/img2.png"),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset("images/img3.png"),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset("images/img4.png"),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset("images/img5.png"),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              f == 0
                  ? Center(
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: sellers.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Card(
                                elevation: 7,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                child: Column(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width - 24,
                                      height: 20,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text(
                                          "${sellers[index].seller}",
                                          style:
                                              TextStyle(color: Color(0xff636363)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width - 24,
                                      height: 80,
                                      color: Color(0xfff4f3df),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      "${sellers[index].product}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Product",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${sellers[index].variety}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Variety",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffe3e2d0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text(
                                                    "₹${sellers[index].price}",
                                                    style: TextStyle(
                                                        color: Color(0xff7eb986)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${sellers[index].avgWeight}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "avg weight",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${sellers[index].perBox}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "per box",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${sellers[index].boxes}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Boxes",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${sellers[index].delivery}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Delivery",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      )),
    );
  }
}
