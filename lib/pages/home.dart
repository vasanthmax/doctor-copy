import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late String uservalue;
  Future getUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String _user = _prefs.getString("user")!;
    setState(() {
      uservalue = _user;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Color(0xffFF0000).withOpacity(0.6),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -MediaQuery.of(context).size.height * 0.04,
                  left: -MediaQuery.of(context).size.height * 0.06,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffFF0000).withOpacity(0.3),
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.02,
                  right: -MediaQuery.of(context).size.height * 0.05,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffFF0000).withOpacity(0.3),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.12,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hi Buddy!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                        IconButton(
                            iconSize: 30,
                            icon: Icon(Icons.notifications),
                            color: Colors.yellowAccent,
                            onPressed: () {})
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    suffixIcon: Icon(Icons.search),
                                    hintText: 'Search'),
                              ),
                            )),
                      ]),
                    )),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recommended',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Text(
                              'See more',
                              style: TextStyle(color: Color(0xff17BDE1)),
                            ),
                          ),
                        ],
                      ),
                      GridView(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 5,
                          childAspectRatio:
                              MediaQuery.of(context).size.height / 1000,
                        ),
                        children: [
                          Container(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xff14c4fc),
                                  radius: 45,
                                  child: CircleAvatar(
                                      radius: 43,
                                      backgroundImage: NetworkImage(
                                          'https://images.pexels.com/photos/5327585/pexels-photo-5327585.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')),
                                ),
                                Text(
                                  'Dr.meera',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Cardiologist',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.6)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xff14c4fc),
                                  radius: 45,
                                  child: CircleAvatar(
                                      radius: 43,
                                      backgroundImage: NetworkImage(
                                          'https://images.pexels.com/photos/5327585/pexels-photo-5327585.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')),
                                ),
                                Text(
                                  'Dr.meera',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Cardiologist',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.6)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xff14c4fc),
                                  radius: 45,
                                  child: CircleAvatar(
                                      radius: 43,
                                      backgroundImage: NetworkImage(
                                          'https://images.pexels.com/photos/5327585/pexels-photo-5327585.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')),
                                ),
                                Text(
                                  'Dr.meera',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Cardiologist',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.6)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Specialist',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Text(
                              'See more',
                              style: TextStyle(color: Color(0xff17BDE1)),
                            ),
                          ),
                        ],
                      ),
                      GridView(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio:
                              MediaQuery.of(context).size.height / 1000,
                        ),
                        children: [
                          Specialist(
                            special: 'Physiotherapy',
                            color: Color(0xff14c4fc),
                            image: "assets/physical-therapy.png",
                          ),
                          Specialist(
                            special: 'Dentist',
                            color: Color(0xffff5a5a),
                            image: "assets/dentist.png",
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class Specialist extends StatelessWidget {
  final String special;
  final Color color;
  final String image;
  const Specialist(
      {required this.special, required this.color, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [color.withOpacity(0.8), color.withOpacity(0.3)]),
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Image(
            image: AssetImage(
              image,
            ),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          Text(special,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
