import 'package:flutter/material.dart';

import '../models/models.dart';
import 'widgets.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;

  const ContactsList({
    Key key, 
    @required this.users
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.grey[600]
                  ),
                )
              ),

              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),

              const SizedBox(width: 8),

              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              ),

            ],
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: users.length,
              itemBuilder: (BuildContext context , int index){
                final User user = users[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: UserCard(user: user),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}