import 'package:flutter/material.dart';
import 'package:first_app_filter/messanger_screen.dart';

class StoryElement extends StatelessWidget {
  final Users user;

  StoryElement({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.purpleAccent],
                ),
              ),
              padding: EdgeInsets.all(3),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade200,
                  child: Text(
                    user.name?[0] ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 2,
              right: 2,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        SizedBox(
          width: 60,
          child: Text(
            user.name ?? '',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
