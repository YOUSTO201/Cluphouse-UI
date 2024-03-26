import 'package:cluphouse/models/room.dart';
import 'package:cluphouse/screens/room_screen.dart';
import 'package:cluphouse/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoomCard extends StatelessWidget {
  // const RoomCard({super.key});
  final Room room;

  const RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => RoomScreen(room: room),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          color:  Color(0xFF222326),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                '${room.club}🏠'.toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      // letterSpacing: -2.0,
                    ),
              ),
              Text(
                room.name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 28.0,
                            top: 24.0,
                            child: userProfileImage(
                                imageUrl: room.speakers[0].imageURL, size: 48),
                          ),
                          userProfileImage(
                              imageUrl: room.speakers[1].imageURL, size: 48),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      // color: Colors.green,
                      // height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...room.speakers.map((e) => Text(
                                '${e.firstName}   ${e.lastName}💬',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13),
                              )),
                          SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '${room.speakers.length + room.followedBySpeakers.length + room.others.length} ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xFF9CA3A6),
                                  ),
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.person_fill,
                                    size: 15,
                                    color: Color(0xFF9CA3A6),
                                  ),
                                ),
                                TextSpan(
                                  text: '  /   ${room.speakers.length} ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xFF9CA3A6),
                                  ),
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.chat_bubble_fill,
                                    size: 15,
                                    color: Color(0xFF9CA3A6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
