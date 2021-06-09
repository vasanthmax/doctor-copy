import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: statusBarHeight + statusBarHeight,
                  bottom: statusBarHeight),
              child: Text(
                'Profile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            PhotoWiget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hema desosa'),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Image(image: AssetImage('assets/edit.png')),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ProfileList('General data', Icons.person),
            ProfileList('Customer Service', Icons.support_agent),
            ProfileList('App Feedback', Icons.insert_comment),
            ProfileList('Refferal program', Icons.people),
            ProfileList('Settings', Icons.settings)
          ],
        ),
      ),
    );
  }
}

class ProfileList extends StatelessWidget {
  final String data;
  final IconData icon;
  const ProfileList(this.data, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Row(
        children: [
          Icon(
            icon,
            size: 25,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Text(
            data,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Image(image: AssetImage('assets/left-arrow.png'))
        ],
      ),
    );
  }
}

class PhotoWiget extends StatelessWidget {
  const PhotoWiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                  height: MediaQuery.of(context).size.height * 0.15,
                  image: NetworkImage(
                      'https://www.webxcreation.com/event-recruitment/images/profile-1.jpg')),
            ),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.camera_alt,
                ),
              ))
        ],
      ),
    );
  }
}
