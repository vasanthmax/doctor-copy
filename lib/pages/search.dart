import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
        padding: EdgeInsets.symmetric(vertical: statusBarHeight),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffEBEBEB),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(Icons.search), onPressed: () {}),
                            border: InputBorder.none,
                            hintText: 'Search'),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.filter_list_alt), onPressed: () {})
                  ],
                ),
              )

              // Container(
              //   color: Colors.green,
              //   height: MediaQuery.of(context).size.height * 0.3,
              //   child: Row(
              //     children: [
              //       Container(
              //         height: MediaQuery.of(context).size.height * 0.2,
              //         width: double.infinity,
              //         child: TextField(
              //           decoration: InputDecoration(
              //               hintText: 'Search',
              //               suffixIcon: IconButton(
              //                   icon: Icon(Icons.search), onPressed: () {})),
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ));
  }
}
