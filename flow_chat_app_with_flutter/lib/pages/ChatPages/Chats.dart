import 'package:flow_chat_app_with_flutter/data/chatList.dart';
import 'package:flow_chat_app_with_flutter/routes/chat_app_routes.dart';
import 'package:flow_chat_app_with_flutter/widgets/MyAppBar.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(title: "Chats"),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add, color: Colors.white,),
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return Card(
            elevation: 0,
            child: ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    radius: size.width * 0.06,
                    backgroundImage: NetworkImage(chat.avatarUrl),
                  ),

                  // Online indicator
                  if (chat.isOnline)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: size.width * 0.032,
                        width: size.width * 0.032,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
              ),

              title: Text(
                chat.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: Text(
                chat.lastMessage,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(chat.time),

                  if (chat.unreadCount > 0)
                    Container(
                      margin: EdgeInsets.only(top: size.width * (5 / 375)),
                      padding: EdgeInsets.all(size.width * (6 / 375)),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        chat.unreadCount.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                ],
              ),
              onTap: () {
                // ChatDetail Page..
                Navigator.pushNamed(context, ChatAppRoutes.chatDetail, arguments: chatList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
