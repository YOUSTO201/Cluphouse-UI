import 'package:cluphouse/data.dart';
import 'package:cluphouse/widgets/room_card.dart';
import 'package:cluphouse/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:cluphouse/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: GNav(
          tabs: const [
            GButton(
              icon: Icons.home_rounded,
              iconSize: 32.5,
              margin: EdgeInsets.only(left: 10),
            ),
            GButton(
              icon: Icons.search_rounded,
              iconSize: 32.5,
            ),
            GButton(
              icon: Icons.person_add_alt_rounded,
              iconSize: 32.5,
            ),
            GButton(
              icon: Icons.voice_chat,
              iconSize: 32.5,
              margin: EdgeInsets.only(right: 10),
            ),
          ],
        ),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Cluphouse',
            style: GoogleFonts.montserrat(
              letterSpacing: -2.5,
              fontSize: 33,
              fontWeight: FontWeight.w800,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                CupertinoIcons.bell,
                size: 30,
              ),
              onPressed: () {},
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: userProfileImage(
                  size: 37,
                  imageUrl: currentUser.imageURL,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
              children: [
                ...roomList.map((e) => RoomCard(room: e)),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.1),
                      Theme.of(context).scaffoldBackgroundColor,
                    ])),
              ),
            ),
            Positioned(
              bottom: 25,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(18, 12, 18, 12),
                  backgroundColor: Theme.of(context).hintColor,
                ),
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.add,
                  size: 24,
                  color: Colors.white,
                ),
                label: Text(
                  'Start a room',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ));
  }
}
