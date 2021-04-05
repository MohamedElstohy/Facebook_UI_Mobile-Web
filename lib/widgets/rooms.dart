import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

import '../config/palette.dart';
import '../models/models.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({
    Key key, 
    this.onlineUsers
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: isDesktop ? BorderRadius.circular(10) : null,
          color: Colors.white ,
        ),
        height: 60.0, 
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 4.0 , 
            vertical: 10.0
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context , int index){
            if(index == 0){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }

            final User user = onlineUsers[index-1];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0 ),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          }
        ),
      ),
    );
  }
}


class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create Room'),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), 
        ),
        backgroundColor: Colors.white,
        side: BorderSide(
          width: 3.0,
          color: Colors.blueAccent[100]
        ),
        textStyle: TextStyle(
          color: Palette.facebookBlue
        )
      ),
      child: Row(
        children: [
          // ShaderMask(
          //   shaderCallback: (rect) => 
          //     Palette.createRoomGradient.createShader(rect),
          //   child: Icon(
          //     Icons.video_call,
          //     size: 35,
          //     color: Colors.white,
          //   ),
          // ),

          Icon(
            Icons.video_call,
            size: 35,
            color: Colors.purple,
          ),

          const SizedBox(width: 4.0),

          Text(
            'Create\nRoom'
          )
        ],
      ),
    );
  }
}