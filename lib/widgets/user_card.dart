import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

import '../models/models.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    Key key, 
    @required this.user
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){}, // => print('Profile')
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),

          const SizedBox(width: 6),

          Flexible(
            child: Text(
              user.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16
              ),
            ),
          ),
        ],
      ),
    );
  }
}