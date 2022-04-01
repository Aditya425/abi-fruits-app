import 'package:abi_fruits_app/modal/seller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  static String id = "DetailsScreen";
  final Seller seller;
  DetailsScreen(this.seller);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
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
                          "${widget.seller.seller}",
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
                                      "${widget.seller.product}",
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
                                      "${widget.seller.variety}",
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
                                    "₹${widget.seller.price}",
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
                                      "${widget.seller.avgWeight}",
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
                                      "${widget.seller.perBox}",
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
                                      "${widget.seller.boxes}",
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
                                      "${widget.seller.delivery}",
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
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 40,
                child: Text(
                  "Hello buyer, we have ${widget.seller.product} ready to ship"
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.transparent
                  )
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                    "Do let me know"
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                        color: Colors.transparent
                    )
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                  "Hello buyer, we have ${widget.seller.product} ready to ship"
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.transparent
                  )
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                  "Hello buyer, we have ${widget.seller.product} ready to ship"
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.transparent
                  )
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.4,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.send),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
