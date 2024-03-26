import 'dart:math';
import 'dart:ui';

import 'package:cluphouse/data.dart';
import 'package:cluphouse/models/room.dart';
import 'package:cluphouse/widgets/room_user_profil.dart';
import 'package:cluphouse/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomScreen extends StatelessWidget {
  // const RoomScreen({super.key});

  final Room room;

  const RoomScreen({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            CupertinoIcons.chevron_down,
            size: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          label: const Text(
            '                    ',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFFE6694B),
            ),
          ),
        ),
        elevation: 0,
        leadingWidth: 200,
        actions: [
          TextButton(
            onPressed:() => Navigator.of(context).pop(),
            child: Text('✌️Leave quietly'),
            style: TextButton.styleFrom(
              foregroundColor: Color(0xFFE6694B),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF222326),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${room.club}🏠'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.0,
                            ),
                      ),
                      Icon(CupertinoIcons.ellipsis),
                    ],
                  ),
                  Text(
                    room.name.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 11.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                children: room.speakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.lastName,
                          size: 66,
                          isNew: Random().nextBool(),
                          isMuted: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Followed by Speakers '.toUpperCase(),
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9CA3A6),
                    ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 15,
                children: room.followedBySpeakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.lastName,
                          size: 66,
                          isNew: Random().nextBool(),
                          // isMuted: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            // SizedBox(height: 2,),
            SliverToBoxAdapter(
              child: Text(
                'Others in the room '.toUpperCase(),
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9CA3A6),
                    ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 15,
                children: room.others
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.lastName,
                          size: 66,
                          isNew: Random().nextBool(),
                          // isMuted: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
