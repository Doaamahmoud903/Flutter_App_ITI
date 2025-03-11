import 'package:flutter/material.dart';
import 'package:first_app_filter/messanger_screen.dart';

class ChatElement extends StatelessWidget {
  ChatElement({super.key, required this.user});
  Users user;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        CircleAvatar(
          child: Text(
            "${user.name?.split("")[0]}",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${user.name}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(child: Text("${user.message}" , maxLines: 1,overflow: TextOverflow.ellipsis,)),
                  Text("${user.time}")
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}