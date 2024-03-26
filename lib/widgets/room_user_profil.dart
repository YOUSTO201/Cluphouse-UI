import 'package:cluphouse/data.dart';
import 'package:cluphouse/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoomUserProfile extends StatelessWidget {
  // const RoomUserProfile({super.key});

  final double fontSize;
  final String imageUrl;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfile({
    super.key,
    required this.imageUrl,
    required this.name,
    this.size = 30,
    this.fontSize = 30,
    this.isNew = false,
    this.isMuted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: userProfileImage(imageUrl: imageUrl, size: size),
            ),
            if (isNew)
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Color(0xFF2A2B30),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 7),
                          blurRadius: 4,
                        ),
                      ]),
                  child: Text(
                    '🎉',
                    style: TextStyle(
                      fontSize: 13.5,
                    ),
                  ),
                ),
              ),
            if (isMuted)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Color(0xFF2A2B30),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 7),
                          blurRadius: 4,
                        ),
                      ]),
                  child: Icon(
                    CupertinoIcons.mic_off,
                    color: Color(0xFF9CA3A6),
                    size: 20,
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(7),
          child: Flexible(
            child: Text(
              '${name}',
              style: TextStyle(
                fontSize: 12.5,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
