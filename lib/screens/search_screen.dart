import 'dart:ui';

import 'package:abi_fruits_app/modal/seller.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static String id = "SearchScreen";
  final List<Seller> list;
  SearchScreen(this.list);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Seller> _local = [];

  @override
  void initState() {
    super.initState();
    _local = widget.list;
  }

  void searchQuery(String query) {
    var searchedSellers = widget.list.where(
        (seller) {
            String sellerName = seller.seller.toLowerCase();
            String price = seller.price.toString();
            query = query.toLowerCase();
            return sellerName.contains(query) || price.contains(query);
          }
    ).toList();
    _local = searchedSellers;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Color.fromRGBO(237, 237, 237, 1),
        title: Text(
          "Search",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              onChanged: (query) {
                searchQuery(query);
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                          color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                          color: Colors.black)),
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                itemCount: _local.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _local[index].seller,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text(
                      "${_local[index].price}",
                      style: TextStyle(
                          color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
