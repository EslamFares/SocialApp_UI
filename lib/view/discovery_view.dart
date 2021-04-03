import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:social_app_ui/model/user_model.dart';
import 'package:social_app_ui/widgets/count_item_widget.dart';
import 'package:social_app_ui/widgets/profile_info.dart';

class DiscoveryView extends StatefulWidget {
  @override
  _DiscoveryViewState createState() => _DiscoveryViewState();
}

class _DiscoveryViewState extends State<DiscoveryView> {
  final panelController = PanelController();
  int userIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.person_outline),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {},
          ),
        ],
      ),
      body: SlidingUpPanel(
        maxHeight: 400,
        minHeight: 150,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.0),
          topLeft: Radius.circular(25.0),
        ),
        parallaxOffset: .1,
        parallaxEnabled: true,
        controller: panelController,
        color: Colors.transparent,
        body: PageView.builder(
          itemBuilder: (context, index) {
            return Image.network(
              users[index].urlImage,
              fit: BoxFit.cover,
            );
          },
          itemCount: users.length,
          onPageChanged: (index) {
            setState(() {
              userIndex = index;
            });
          },
        ),
        panelBuilder: (ScrollController scroll) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CountItemWidget(
                    upText: '${users[userIndex].countFollowers}  M',
                    downText: 'Followers',
                  ),
                  CountItemWidget(
                    upText: '${users[userIndex].countFollowing}',
                    downText: 'Following',
                  ),
                  CountItemWidget(
                    upText: '${users[userIndex].countPosts}',
                    downText: 'Posts',
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      )),
                  child: ProfileInfo(
                    user: users[userIndex],
                    onPressed: () {
                      setState(() {
                        users[userIndex].isFollowing =
                            !users[userIndex].isFollowing;
                      });
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.teal,
        height: 50,
        index: 0,
        items: [
          Icon(
            Icons.map,
            size: 30,
          ),
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(
            Icons.people,
            size: 30,
          )
        ],
      ),
    );
  }
}
