import 'package:abi_fruits_app/sort_types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortScreen extends StatefulWidget {
  @override
  _SortScreenState createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {

  @override
  Widget build(BuildContext context) {
    String used = Provider.of<SortTypes>(context).sortType;
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 48,
                        height: 60,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(
                                  fontSize: 25
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_downward,
                                size: 50,
                                color: used == "NAME_ASCENDING" ? Colors.green : Colors.black,  ),
                              onPressed: () {
                                Provider.of<SortTypes>(context, listen: false).changeType("NAME_ASCENDING");
                                setState(() {

                                });
                                Navigator.pop(context);
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_upward,
                                size: 50,
                                color: used == "NAME_DESCENDING" ? Colors.green : Colors.black,  ),
                              onPressed: () {
                                Provider.of<SortTypes>(context, listen: false).changeType("NAME_DESCENDING");
                                setState(() {

                                });
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 48,
                        height: 60,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Price",
                              style: TextStyle(
                                fontSize: 25
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_downward,
                                size: 50,
                                color: used == "PRICE_ASCENDING" ? Colors.green : Colors.black,  ),
                              onPressed: () {
                                Provider.of<SortTypes>(context, listen: false).changeType("PRICE_ASCENDING");
                                setState(() {

                                });
                                Navigator.pop(context);
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_upward,
                                size: 50,
                                color: used == "PRICE_DESCENDING" ? Colors.green : Colors.black,  ),
                              onPressed: () {
                                Provider.of<SortTypes>(context, listen: false).changeType("PRICE_DESCENDING");
                                setState(() {

                                });
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
    );
  }
}
