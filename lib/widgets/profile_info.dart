import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app_ui/model/user_model.dart';

class ProfileInfo extends StatelessWidget {
  final UserModel user;
  final Function onPressed;
  const ProfileInfo({
    @required this.user,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: userNameLocation(user)),
                followButton(user)
              ],
            ),
            bioInfo(),
            Text(
              'Photos',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 18),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image: NetworkImage(user.urlPhotos[index]),
                            fit: BoxFit.cover)),
                  );
                },
                itemCount: user.urlPhotos.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container bioInfo() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Center(
          child: Text(
        user.bio,
        style: TextStyle(fontStyle: FontStyle.italic),
      )),
    );
  }

  Widget followButton(UserModel user) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        width: user.isFollowing ? 50 : 150,
        height: 50,
        child: user.isFollowing ? followButtonShape() : unFollowButtonShape(),
      ),
    );
  }

  Widget followButtonShape() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Icon(
        Icons.people,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Widget unFollowButtonShape() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.white,
          border: Border.all(
            color: Colors.teal,
            width: 3,
          )),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Follow',
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.person_add,
              color: Colors.black,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget userNameLocation(UserModel user) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      SizedBox(height: 5),
      Text(user.location),
    ]);
  }
}
