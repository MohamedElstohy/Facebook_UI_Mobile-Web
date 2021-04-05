import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key key, 
    @required this.post
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5.0 , horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: isDesktop ? BorderRadius.circular(10) : null,
          color: Colors.white ,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: _PostHeader(post: post),
                  ),

                  const SizedBox(height: 4.0),

                  Padding(   ///  This Padding For Me
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(post.caption),
                  ),

                  post.imageUrl != null ? SizedBox.shrink() : SizedBox(height: 6,),
                ],
              ),
            ),
            post.imageUrl != null 
                ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                ) 
                : SizedBox.shrink(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: _PostStats(post: post),
            )
          ],
        ),
      ),
    );
  }
}



class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    Key key, 
    @required this.post
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),

        const SizedBox(width: 8),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              Text(
                post.user.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600
                ),
              ),

              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600]
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ),

        IconButton(
          icon: Icon(
            Icons.more_horiz,
          ), 
          onPressed: () => print('More')
        ),
      ],
    );
  }
}



class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({
    Key key, 
    @required this.post
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),

            const SizedBox(width: 4),

            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600]
                ),
              ),
            ),

            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600]
              ),
            ),

            const SizedBox(width: 8),

            Text(
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600]
              ),
            ),
          ],
        ), 

        const Divider(),

        Row(
          children: [
            _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                size: 20,
                color: Colors.grey[600],
              ),

              label: 'Like',

              onTap: () => print('Like')
            ),

            _PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                size: 20,
                color: Colors.grey[600],
              ),

              label: 'Comment',

              onTap: () => print('Comment')
            ),

            _PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                size: 25,
                color: Colors.grey[600],
              ),

              label: 'Share',

              onTap: () => print('Share')
            ),
          ],
        ),
      ],
    );
  }
}


class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({
    Key key, 
    @required this.icon, 
    @required this.label, 
    @required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,

                const SizedBox(width: 4),

                Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}