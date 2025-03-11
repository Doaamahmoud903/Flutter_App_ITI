import 'package:flutter/material.dart';
import 'package:first_app_filter/story_element.dart';
import 'package:first_app_filter/chat_element.dart';

class Users {
  String? name;
  String? message;
  String? time;
  Users({this.name, this.message, this.time});
}

class MessengerScreen extends StatelessWidget {
  MessengerScreen({super.key});

  List<Users> users = [
    Users(name: "Sama Hisham", message: "Hope you're having a great day!", time: "10:00 AM"),
    Users(name: "Eman Fouda", message: "Don't forget our meeting later.", time: "9:45 AM"),
    Users(name: "Eman Samir", message: "Just finished my work. What about you?", time: "8:30 AM"),
    Users(name: "Linda Ahmed", message: "Good morning! Did you sleep well?", time: "7:50 AM"),
    Users(name: "Hend Khaled", message: "I sent you the details, check them out.", time: "11:15 PM"),
    Users(name: "Sara Mostafa", message: "Let's plan something for the weekend.", time: "2:20 PM"),
    Users(name: "Mariam Adel", message: "Can you review the document I sent?", time: "6:00 PM"),
    Users(name: "Yasmin Omar", message: "Waiting for your reply.", time: "5:30 PM"),
    Users(name: "Layla Tarek", message: "I'm on my way! See you soon.", time: "4:45 PM"),
    Users(name: "Rania Salim", message: "Let’s catch up later!", time: "1:10 PM"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,

        title: Text(
          "Chats",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade300,
            child: Icon(Icons.person, color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            SizedBox(height: 15),
            // Stories Section
            SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return StoryElement(user: users[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10);
                },
                itemCount: users.length,
              ),
            ),
            SizedBox(height: 15),
            // Chats List
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ChatElement(user: users[index]);
                },
                separatorBuilder: (context, index) {
                  return Divider(thickness: 0.5, color: Colors.grey.shade300);
                },
                itemCount: users.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
